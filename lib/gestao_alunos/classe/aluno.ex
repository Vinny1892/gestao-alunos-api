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
    |> cast(attrs, [:rga, :nome, :curso,:situacao])
    |> validate_required([:rga, :nome])
    |> validate_format(:rga,~r/\d{4}\.\d{4}.\d{3}.\d{1}/)
    |> unique_constraint(:unique_rga, name: :unique_rga,message: "student already been taken")
  end
end
