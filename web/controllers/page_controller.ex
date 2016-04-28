defmodule ElixirTw.PageController do
  use ElixirTw.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
