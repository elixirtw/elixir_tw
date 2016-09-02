defmodule ElixirTw.User.PostController do
  use ElixirTw.Web, :controller
  use Guardian.Phoenix.Controller

  def new(conn, _params, user, _claim) do
    if user do
      conn |> render("new.html")
    else
      conn |> redirect(to: "/login?origin_url=\/posts\/new")
    end
  end
end
