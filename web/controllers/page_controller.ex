defmodule ElixirTW.PageController do
  use ElixirTW.Web, :controller

  def home(conn, _params) do
    render conn, "home.html"
  end

  def resources(conn, _params) do
    render conn, "resources.html"
  end

  def social_networks(conn, _params) do
    render conn, "social_networks.html"
  end

  def helps(conn, _params) do
    render conn, "helps.html"
  end
end
