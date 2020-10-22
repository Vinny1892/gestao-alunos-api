defmodule GestaoAlunosWeb.AlunoView do
   use GestaoAlunosWeb , :view
   alias GestaoAlunosWeb.AlunoView
  def render("index.json" , %{alunos: alunos}) do
    %{ data: render_many(alunos, AlunoView, "aluno.json")  }
  end

  def render("show.json", %{aluno: aluno}) do
    %{data: render_one(aluno, AlunoView ,"aluno.json") }
  end


   def render("aluno.json", %{aluno: aluno}) do
      %{  nome: aluno.nome  , rga: aluno.rga  , curso: aluno.curso }
   end

end
