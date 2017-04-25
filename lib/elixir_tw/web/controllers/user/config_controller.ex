defmodule ElixirTw.Web.User.ConfigController do
  use ElixirTw.Web, :controller
  use Guardian.Phoenix.Controller

  def dashboard(conn, _params, user, _claim) do
    render(conn, "dashboard.html", user: user)
  end
end
