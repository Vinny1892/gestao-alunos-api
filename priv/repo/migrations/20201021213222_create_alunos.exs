defmodule GestaoAlunos.Repo.Migrations.CreateAlunos do
  use Ecto.Migration

  def change do
    create table(:alunos) do
      add :rga, :string
      add :nome, :string
      add :curso, :string
      add :situacao, :string
      timestamps()
    end



  end
end
