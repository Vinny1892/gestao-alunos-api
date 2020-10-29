defmodule GestaoAlunos.Repo.Migrations.CreateAlunos do
  use Ecto.Migration

  def change do
    create table(:alunos) do
      add :rga, :string
      add :nome, :string
      add :curso, :string
      add :situacao, :string, default: "ativo"
      timestamps()
    end
  create unique_index(:alunos, [:rga], name: :unique_rga )
  end
  def down do
    drop table(:alunos)
  end
end
