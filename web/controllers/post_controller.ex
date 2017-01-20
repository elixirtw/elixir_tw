defmodule ElixirTw.PostController do
  use ElixirTw.Web, :controller

  alias ElixirTw.Post

  def index(conn, _params) do
    posts = fetch_posts
            |> Enum.map( &update_comments_count/1 )
    render(conn, "index.html", posts: posts)
  end

  def show(conn, %{"id" => id}) do
    post = Repo.get(Post, id) |> Repo.preload(:user)
    render(conn, "show.html", post: post)
  end

  defp fetch_posts do
    query = from p in Post,
            order_by: [asc: p.pinned, desc: p.inserted_at],
            preload: [:user, :comments]
    Repo.all(query)
  end

  defp update_comments_count(post), do: Map.put(post, :comments_count, Enum.count(post.comments))
end
