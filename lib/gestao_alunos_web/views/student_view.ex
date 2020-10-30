defmodule GestaoAlunosWeb.StudentView do
  use GestaoAlunosWeb, :view
  alias GestaoAlunosWeb.StudentView

  def render("index.json", %{student: student}) do
    %{
      data: %{
        count: student.count,
        has_next: student.has_next,
        has_prev: student.has_prev,
        firts: student.first,
        last: student.last,
        student: render_many(student.list, StudentView, "student.json")
      }
    }
  end

  def render("show.json", %{student: student}) do
    %{data: render_one(student, StudentView, "student.json")}
  end

  def render("student.json", %{student: student}) do
    %{
      id: student.id,
      nome: student.nome,
      rga: student.rga,
      curso: student.curso,
      situacao: student.situacao,
      registrado_em: student.inserted_at
    }
  end
end
