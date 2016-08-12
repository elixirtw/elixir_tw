defmodule ElixirTw.PostController do
  use ElixirTw.Web, :controller
  use Guardian.Phoenix.Controller

  def index(conn, _params, _user, _claims) do
    conn
    |> render("index.html")
  end

  def new(conn, _params) do
    conn
    |> render("new.html")
  end
end
