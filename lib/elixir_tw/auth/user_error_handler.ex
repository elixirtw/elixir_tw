defmodule ElixirTw.Auth.UserErrorHandler do
  use ElixirTwWeb, :controller

  def auth_error(conn, {_type, reason}, _opts) do
    conn
    |> put_flash(:error, reason)
    |> redirect(to: "/")
  end
end
