defmodule GestaoAlunos.Classe.Aluno do
  use Ecto.Schema
  import Ecto.Changeset

  schema "alunos" do
    field :curso, :string
    field :nome, :string
    field :rga, :string
    field :situacao , :string

    timestamps()
  end


  @doc false
  def changeset(aluno, attrs) do
    aluno
    |> cast(attrs, [:rga, :nome, :curso])
    |> validate_required([:rga, :nome, :curso])
  end
end
