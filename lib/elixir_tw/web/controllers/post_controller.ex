defmodule ElixirTw.Web.PostController do
  use ElixirTw.Web, :controller

  # TODO refactor to context
  alias ElixirTw.Board.Post

  def index(conn, _params) do
    posts = Enum.map(fetch_posts(), &update_comments_count/1)
    render(conn, "index.html", posts: posts)
  end

  def show(conn, %{"id" => id}) do
    post = Post
           |> Repo.get(id)
           |> Repo.preload(:user)
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
