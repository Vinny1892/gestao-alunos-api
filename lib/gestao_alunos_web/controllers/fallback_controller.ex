defmodule GestaoAlunosWeb.FallbackController do
  use GestaoAlunosWeb ,:controller

  # # This clause handles errors returned by Ecto's insert/update/delete.
  # def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
  #   conn
  #   |> put_status(:unprocessable_entity)
  #   |> put_view(GestaoAlunosWeb.ChangesetView)
  #   |> render("error.json", changeset: changeset)
  # end

    # This clause is an example of how to handle resources that cannot be found.
    def call(conn, {:error, status}) when is_atom(status) do
      IO.inspect conn
      code = Plug.Conn.Status.code(status)
      phrase = Plug.Conn.Status.reason_phrase(code)

      conn
      |> put_status(status)
      |> render(
        :errors,
        data: %{
          id: "#{code}",
          title: "#{code} #{phrase}",
          status: code
        }
      )
    end




end
