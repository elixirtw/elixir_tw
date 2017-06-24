defmodule ElixirTw.Web.PageController do
  use ElixirTw.Web, :controller

  def landing(conn, _params) do
    conn
    |> put_layout(false)
    |> render("landing.html")
  end
end
