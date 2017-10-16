defmodule ElixirTwWeb.User.ConfigController do
  use ElixirTwWeb, :controller
  use Guardian.Phoenix.Controller

  def dashboard(conn, _params, user, _claim) do
    render(conn, "dashboard.html", user: user)
  end
end
