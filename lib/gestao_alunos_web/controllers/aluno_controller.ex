defmodule GestaoAlunosWeb.AlunoController do
   use GestaoAlunosWeb , :controller

   alias GestaoAlunos.Classe
   alias GestaoAlunos.Classe.Aluno

   action_fallback GestaoAlunosWeb.FallbackController

   def index(conn, _conn) do
      method = String.to_atom(conn.method)
      case method do
         :PUT ->
            conn
            |> put_status(:method_not_allowed)
            |> render(GestaoAlunosWeb.ErrorView,"405.json")
         :DELETE ->
            conn
            |> put_status(:method_not_allowed)
            |> render(GestaoAlunosWeb.ErrorView,"405.json")
         :GET ->
            alunos = Classe.list_students("Vincius Espindola")
            render(conn, GestaoAlunosWeb.AlunoView, "index.json", alunos: alunos)
      end
   end

   def show(conn,  %{"id" => id}) do
      aluno = Classe.get_student!(id)
      render(conn, "show.json", aluno: aluno)
   end


   def create(conn, params) do
       with {:ok, %Aluno{} = aluno} <- Classe.create_student(params) do
         conn
         |> put_status(:created)
         |> put_resp_header("location", Routes.aluno_path(conn, :show, aluno))
         |> render("show.json", aluno: aluno)
       end
    end

end
