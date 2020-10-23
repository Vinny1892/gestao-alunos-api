defmodule GestaoAlunosWeb.Router do
  use GestaoAlunosWeb, :router



  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", GestaoAlunosWeb do
    pipe_through :api
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" , GestaoAlunosWeb do
      pipe_through [:fetch_session]
      live_dashboard "/dashboard", metrics: GestaoAlunosWeb.Telemetry
      #rotas erradas
      post "/alunos" , AlunoController , :create
      put "/alunos" , AlunoController , :index
      delete "/alunos" , AlunoController , :index
      post "/alunos/:id" , AlunoController , :show
      resources "/alunos" , AlunoController , except: [:new ,:edit]

    end
  end
end
