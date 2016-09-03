defmodule ElixirTw.User.PostController do
  use ElixirTw.Web, :controller
  use Guardian.Phoenix.Controller

  alias ElixirTw.Post

  def new(conn, _params, user, _claim) do
    if user do
      changeset = Post.changeset(%{})
      conn |> render("new.html", changeset: changeset)
    else
      conn |> redirect(to: "/login?origin_url=\/posts\/new")
    end
  end

  def create(conn, params, user, _claim) do
  end
end
