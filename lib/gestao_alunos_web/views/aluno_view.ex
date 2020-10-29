defmodule GestaoAlunosWeb.AlunoView do
  use GestaoAlunosWeb, :view
  alias GestaoAlunosWeb.AlunoView

  def render("index.json", %{alunos: alunos}) do
    %{
      data: %{
        count: alunos.count,
        has_next: alunos.has_next,
        has_prev: alunos.has_prev,
        firts: alunos.first,
        last: alunos.last,
        alunos: render_many(alunos.list, AlunoView, "aluno.json")
      }
    }
  end

  def render("show.json", %{aluno: aluno}) do
    %{data: render_one(aluno, AlunoView, "aluno.json")}
  end

  def render("aluno.json", %{aluno: aluno}) do
    %{
      id: aluno.id,
      nome: aluno.nome,
      rga: aluno.rga,
      curso: aluno.curso,
      situacao: aluno.situacao,
      registrado_em: aluno.inserted_at
    }
  end
end
