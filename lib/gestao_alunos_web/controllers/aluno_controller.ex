defmodule GestaoAlunosWeb.AlunoController do
  use GestaoAlunosWeb, :controller

  alias GestaoAlunos.Classe
  alias GestaoAlunos.Classe.Aluno

  action_fallback GestaoAlunosWeb.FallbackController

  def index(conn, _params) do
    is_method = String.to_atom(conn.method) |> verify_method(conn, :GET)
    if is_method do
      alunos = Classe.list_students("seila")
      conn
      |> put_status(:ok)
      |> put_view(GestaoAlunosWeb.AlunoView)
      |> render( "index.json", alunos: alunos)

    end
  end

  def show(conn, %{"id" => id}) do
    is_method = String.to_atom(conn.method) |> verify_method(conn, :GET)

    if Integer.parse(id) === :error,
      do: conn |> put_status(:bad_request) |> render(GestaoAlunosWeb.ErrorView, "400.json")


    if is_method do
      aluno = Classe.get_student!(id)
      render(conn, "show.json", aluno: aluno)
    end
  end

  def create(conn, params) do
    is_method = String.to_atom(conn.method) |> verify_method(conn, :POST)


    if is_method do
      IO.inspect(params)

      with {:ok, %Aluno{} = aluno} <- Classe.create_student(params) do
        conn
        |> put_status(:created)
        |> put_resp_header("location", Routes.aluno_path(conn, :show, aluno))
        |> render("show.json", aluno: aluno)
      else
        {:error, %Ecto.Changeset{} = changeset} -> {:error, changeset}
      end
    end
  end

  def update(conn, params) do
    is_method = String.to_atom(conn.method) |> verify_method(conn, :PUT)

    if is_method do
      {id, student_params} = Map.pop(params, "id")

      if Integer.parse(id) === :error,
        do: conn |> put_status(:bad_request) |> render(GestaoAlunosWeb.ErrorView, "400.json")

      aluno = Classe.get_student!(String.to_integer(id))

      with {:ok, %Aluno{} = aluno} <- Classe.update_student(aluno, student_params) do
        conn
        |> put_status(:ok)
        |> render("show.json", aluno: aluno)
      else
        {:error, %Ecto.Changeset{} = changeset} -> {:error, changeset}
      end
    end
  end

  def delete(conn, %{"id" => id}) do
    is_method = String.to_atom(conn.method) |> verify_method(conn, :DELETE)

    if is_method do
      if Integer.parse(id) === :error,
        do: conn |> put_status(:bad_request) |> render(GestaoAlunosWeb.ErrorView, "400.json")

      aluno = Classe.get_student!(id)

      with {:ok, %Aluno{} = aluno} <- Classe.delete_student(aluno) do
        conn
        |> put_status(:ok)
        |> render("show.json", aluno: aluno)
      else
        {:error, %Ecto.Changeset{} = changeset} -> {:error, changeset}
      end
    end
  end

  def show_page(conn, %{"nome" => nome}) do
    aluno = Classe.list_students(nome)
    render(conn, GestaoAlunosWeb.AlunoView, "index.json", aluno: aluno)
  end

  defp verify_method(method, conn, right_method)
  when is_atom(method) and is_atom(right_method) do
    is_method = method === right_method

    unless is_method do
      conn
      |> put_status(:method_not_allowed)
      |> render(GestaoAlunosWeb.ErrorView, "405.json")
    end

    # return true if method not render
    true
  end
end
