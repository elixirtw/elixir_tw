defmodule ElixirTw.PostController do
  use ElixirTw.Web, :controller

  alias ElixirTw.Post

  def index(conn, _params) do
    posts = fetch_posts

    render(conn, "index.html", posts: posts)
  end

  def show(conn, %{"id" => id}) do
    post = Repo.get(Post, id)
    render(conn, "show.html", post: post)
  end

  defp fetch_posts do
    query = from p in Post,
            order_by: [asc: p.pinned, desc: p.inserted_at],
            preload: [:user]

    Repo.all(query)
  end
end
