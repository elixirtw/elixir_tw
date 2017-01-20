defmodule ElixirTw.User.ConfigController do
  use ElixirTw.Web, :controller
  use Guardian.Phoenix.Controller

  alias ElixirTw.User

  def dashboard(conn, _params, user, _claim) do
    render(conn, "dashboard.html", user: user)
  end
end
