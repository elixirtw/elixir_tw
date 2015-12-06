defmodule Elixirtaipei.PageController do
  use Elixirtaipei.Web, :controller

  def home(conn, _params) do
    render conn, "index.html"
  end

  def resources(conn, _params) do
    render conn, "resources.html"
  end

  def groups(conn, _params) do
    render conn, "groups.html"
  end
end
