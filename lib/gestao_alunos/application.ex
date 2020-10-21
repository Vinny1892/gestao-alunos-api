defmodule GestaoAlunos.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      GestaoAlunos.Repo,
      # Start the Telemetry supervisor
      GestaoAlunosWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: GestaoAlunos.PubSub},
      # Start the Endpoint (http/https)
      GestaoAlunosWeb.Endpoint
      # Start a worker by calling: GestaoAlunos.Worker.start_link(arg)
      # {GestaoAlunos.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: GestaoAlunos.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    GestaoAlunosWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
