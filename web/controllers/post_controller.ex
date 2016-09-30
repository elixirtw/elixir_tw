defmodule ElixirTw.PostController do
  use ElixirTw.Web, :controller

  alias ElixirTw.Post

  def index(conn, _params) do
    posts = fetch_posts
    conn
    |> render("index.html", posts: posts)
  end

  defp fetch_posts do
    query = from p in Post,
            order_by: [asc: p.pinned, desc: p.inserted_at],
            select: p,
            preload: [:user]

    Repo.all(query)
  end
end
