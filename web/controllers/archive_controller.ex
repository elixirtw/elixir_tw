defmodule Elixirtaipei.ArchiveController do
  use Elixirtaipei.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
