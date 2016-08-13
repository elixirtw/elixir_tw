defmodule ElixirTw.PostController do
  use ElixirTw.Web, :controller
  use Guardian.Phoenix.Controller

  def index(conn, _params, _user, _claim) do
    conn
    |> render("index.html")
  end

  def new(conn, _params, user, _claim) do
    if user do
      conn |> render("new.html")
    else
      conn |> redirect(to: "/login?origin_url=\/posts\/new")
    end
  end
end
