defmodule GestaoAlunosWeb.AlunoController do
  use GestaoAlunosWeb, :controller

  alias GestaoAlunos.Classe
  alias GestaoAlunos.Classe.Aluno

  action_fallback GestaoAlunosWeb.FallbackController

  def index(conn, _conn) do
    is_method = String.to_atom(conn.method) |> verify_method?(conn, :GET)

    if is_method do
      alunos = Classe.list_students("Vincius Espindola")

      conn
      |> put_status(:ok)
      |> render(GestaoAlunosWeb.AlunoView, "index.json", alunos: alunos)
    end
  end

  def show(conn, %{"id" => id}) do
    aluno = Classe.get_student!(id)
    render(conn, "show.json", aluno: aluno)
  end

  def create(conn, params) do
    with {:ok, %Aluno{} = aluno} <- Classe.create_student(params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.aluno_path(conn, :show, aluno))
      |> render("show.json", aluno: aluno)
    else
      {:error, %Ecto.Changeset{} = changeset} -> {:error, changeset}
    end
  end

  def update(conn,
  %{"curso"=> curso ,"id" => id , "nome" => nome , "rga"=> rga, "situacao"=> situacao}) do
    #IO.inspect params
    new_student = %{
      "nome" => nome,
      "curso"=> curso,
      "rga" => rga,
      "situacao" => situacao
    }
    aluno = Classe.get_student!(String.to_integer(id))
    IO.inspect(aluno)
    with {:ok, %Aluno{} = aluno} <- Classe.update_student(aluno,new_student) do
      conn
      |> put_status(:ok)
      |> render("show.json", aluno: aluno)
    else
     {:error, %Ecto.Changeset{} = changeset} -> {:error, changeset}
    end
  end

  def delete(conn, %{"id" => id}) do
    aluno = Classe.get_student!(id)

    with {:ok, %Aluno{} = aluno} <- Classe.delete_student(aluno) do
      conn
      |> put_status(:ok)
      |> render("show.json", aluno: aluno)
    else
      {:error, %Ecto.Changeset{} = changeset} -> {:error, changeset}
    end
  end

  defp verify_method?(method, conn, right_method)
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
