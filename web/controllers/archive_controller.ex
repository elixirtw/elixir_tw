defmodule ElixirTW.ArchiveController do
  use ElixirTW.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
