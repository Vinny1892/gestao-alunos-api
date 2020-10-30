defmodule GestaoAlunosWeb.StudentController do
  use GestaoAlunosWeb, :controller

  alias GestaoAlunos.Class
  alias GestaoAlunos.Class.Student

  action_fallback GestaoAlunosWeb.FallbackController

  def index(conn, params) do
    is_method = String.to_atom(conn.method) |> verify_method(conn, :GET)

    if is_method do
      {name, _} = Map.pop(params, "nome")
      %{"pagina" => pagina, "limite" => limite} = params

      if Integer.parse(limite) === :error or Integer.parse(pagina) === :error do
        conn
        |> put_status(:bad_request)
        |> render(GestaoAlunosWeb.ErrorView, "400.json")
      end

      limit = String.to_integer(limite)
      page = String.to_integer(pagina)
      conn
      |> find(name,page,limit)
    end
  end

  def show(conn, %{"id" => id}) do
    is_method = String.to_atom(conn.method) |> verify_method(conn, :GET)

    if Integer.parse(id) === :error,
      do:
        conn
        |> put_status(:bad_request)
        |> render(GestaoAlunosWeb.ErrorView, "400.json")

    if is_method do
      student = Class.get_student!(id)
      render(conn, "show.json", student: student)
    end
  end

  def create(conn, params) do
    is_method = String.to_atom(conn.method) |> verify_method(conn, :POST)

    if is_method do
      with {:ok, %Student{} = student} <- Class.create_student(params) do
        conn
        |> put_status(:created)
        |> put_resp_header("location", Routes.student_path(conn, :show, student))
        |> render("show.json", student: student)
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
        do:
          conn
          |> put_status(:bad_request)
          |> render(GestaoAlunosWeb.ErrorView, "400.json")

      student = Class.get_student!(String.to_integer(id))

      with {:ok, %Student{} = student} <- Class.update_student(student, student_params) do
        conn
        |> put_status(:ok)
        |> render("show.json", student: student)
      else
        {:error, %Ecto.Changeset{} = changeset} -> {:error, changeset}
      end
    end
  end

  def delete(conn, %{"id" => id}) do
    is_method = String.to_atom(conn.method) |> verify_method(conn, :DELETE)

    if is_method do
      if Integer.parse(id) === :error,
        do:
          conn
          |> put_status(:bad_request)
          |> render(GestaoAlunosWeb.ErrorView, "400.json")

      student = Class.get_student!(id)

      with {:ok, %Student{} = student} <- Class.delete_student(student) do
        conn
        |> put_status(:ok)
        |> render("show.json", student: student)
      else
        {:error, %Ecto.Changeset{} = changeset} -> {:error, changeset}
      end
    end
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

  defp find(conn,name \\ nil ,page,limit) do
      student = Class.list_students(name, page, limit)
      conn
      |> put_status(:ok)
      |> put_view(GestaoAlunosWeb.StudentView)
      |> render("index.json", student: student)
  end


end
