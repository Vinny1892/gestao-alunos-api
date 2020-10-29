defmodule GestaoAlunos.Classe do
  alias GestaoAlunos.Classe.Aluno
  import Ecto.Query
  alias GestaoAlunos.Repo
  alias GestaoAlunos.Pagination

  def list_students(nome \\ "", page \\ 2, per_page \\ 4) do
    if nome === nil do
      Aluno
      |> Pagination.page(page, per_page: per_page)
    else
      Aluno
      |> where(nome: ^nome)
      |> Pagination.page(page, per_page: per_page)
    end
  end

  def create_student(attrs \\ %{}) do
    %Aluno{}
    |> Aluno.changeset(attrs)
    |> Repo.insert(returning: true)
  end

  def get_student!(id), do: Repo.get!(Aluno, id)

  def update_student(%Aluno{} = aluno, attrs) do
    aluno
    |> Aluno.changeset(attrs)
    |> Repo.update()
  end

  def delete_student(%Aluno{} = aluno) do
    Repo.delete(aluno)
  end
end
