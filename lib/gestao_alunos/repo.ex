defmodule GestaoAlunos.Repo do
  use Ecto.Repo,
    otp_app: :gestao_alunos,
    adapter: Ecto.Adapters.Postgres
end
