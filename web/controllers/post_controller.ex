defmodule ElixirTw.PostController do
  use ElixirTw.Web, :controller

  def index(conn, _params) do
    conn
    |> render("index.html")
  end

  def new(conn, _params) do
    conn
    |> render("new.html")
  end
end
