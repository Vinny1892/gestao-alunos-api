defmodule GestaoAlunos.Classe do
  alias GestaoAlunos.Classe.Aluno
  import Ecto.Query
  alias GestaoAlunos.Repo

  def list_students(_name, _limit \\ 25, _pagina \\ 1) do
    # resp =Ecto.Adapters.SQL.query!(Repo, "SELECT * FROM alunos where nome = $1", ["seila123"])
    # IO.inspect(resp)
    #Repo.get_by!(Aluno, nome: name)
    #Repo.all(from a in Aluno, where: a.nome == ^name)
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
