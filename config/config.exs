# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :gestao_alunos,
  ecto_repos: [GestaoAlunos.Repo]

# Configures the endpoint
config :gestao_alunos, GestaoAlunosWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "hcRjInxYwEyz+s3huZR5ETOU6Hc4MdYlHaXBCotKehKx5nJmsYiWwOPYntM/aznr",
  render_errors: [view: GestaoAlunosWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: GestaoAlunos.PubSub,
  live_view: [signing_salt: "luixLqLD"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
