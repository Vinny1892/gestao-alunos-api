defmodule GestaoAlunosWeb.FallbackController do
  use GestaoAlunosWeb ,:controller

  def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
    conn
    |> put_status(:bad_request)
    |> render(GestaoAlunosWeb.ChangesetView, "error.json", changeset: changeset)
  end

  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> render(GestaoAlunosWeb.ErrorView, :"404")
  end





end
