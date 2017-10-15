defmodule ElixirTwWeb.PageController do
  use ElixirTwWeb, :controller

  def landing(conn, _params) do
    conn
    |> put_layout(false)
    |> render("landing.html")
  end
end
