defmodule ElixirTw.PageController do
  use ElixirTw.Web, :controller

  def index(conn, _params) do
    conn
    |> put_flash( :notice, "ohei" )
    |> put_flash( :error, "foo" )
    |> render("index.html")
  end
end
