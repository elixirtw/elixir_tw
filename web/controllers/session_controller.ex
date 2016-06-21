defmodule ElixirTw.SessionController do
  use ElixirTw.Web, :controller

  alias ElixirTw.User
  alias ElixirTw.UserQuery

  plug :scrub_params, "user" when action in [:create]

  def create(conn, params = %{}) do
    #conn
    #|> put_flash(:info, "Logged in.")
    #|> Guardian.Plug.sign_in(verified_user)
    #|> redirect(to: user_path(conn, :index))
  end

  def new(conn, _params) do
    render(conn, "new.html")
  end

  def delete(conn, _params) do
    #Guardian.Plug.sign_out(conn)
    #|> put_flash(:info, "Logged out successfully")
    #|> redirect(to: "/")
  end
end
