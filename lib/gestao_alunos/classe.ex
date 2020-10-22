defmodule GestaoAlunos.Classe do
  alias GestaoAlunos.Classe.Aluno
  import Ecto.Query
  alias GestaoAlunos.Repo





  def list_students do
    Repo.all(Aluno)
  end


  def create_student(attrs \\ %{}) do
    %Aluno{}
    |> Aluno.changeset(attrs)
    |> Repo.insert()
  end


  def get_student!(id) , do: Repo.get!(Aluno,id)

  def update_user(%Aluno{} = aluno, attrs) do
    aluno
    |> Aluno.changeset(attrs)
    |> Repo.update()
  end
  def delete_user(%Aluno{} = aluno) do
    Repo.delete(aluno)
  end


end
