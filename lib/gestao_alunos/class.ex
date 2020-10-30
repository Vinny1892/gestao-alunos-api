defmodule GestaoAlunos.Class do
  alias GestaoAlunos.Class.Student
  import Ecto.Query
  alias GestaoAlunos.Repo
  alias GestaoAlunos.Pagination

  def list_students(nome \\ "", page \\ 1 , per_page \\ 25) do
    if nome === nil do
      Student
      |> Pagination.page(page, per_page: per_page)
    else
      Student
      |> where(nome: ^nome)
      |> Pagination.page(page, per_page: per_page)
    end
  end

  def create_student(attrs \\ %{}) do
    %Student{}
    |> Student.changeset(attrs)
    |> Repo.insert(returning: true)
  end

  def get_student!(id), do: Repo.get!(Student, id)

  def update_student(%Student{} = student, attrs) do
    student
    |> Student.changeset(attrs)
    |> Repo.update()
  end

  def delete_student(%Student{} = student) do
    Repo.delete(student)
  end
end
