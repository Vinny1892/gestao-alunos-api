defmodule GestaoAlunosWeb.FallbackController do
  use GestaoAlunosWeb, :controller

  def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
    conn
    |> put_status(:bad_request)
    |> put_view(GestaoAlunosWeb.Changeset)
    |> render("error.json", changeset: changeset)
  end

  def call(conn, {:error, _}) do
    conn
    |> put_status(:not_found)
    |> put_view(GestaoAlunosWeb.ErrorView)
    |> render("404.json")
  end

  def call(conn, assign) do
    conn
    |> put_status(500)
    |> put_view(GestaoAlunosWeb.ErrorView)
    |> render("500.json")
  end
end
