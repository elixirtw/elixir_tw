defmodule ElixirTw.Board do
  @moduledoc """
  Interface for Board context.
  """

  use ElixirTw.Web, :context

  alias ElixirTw.Board.Post

  def get_posts do
    Post
    |> order_by([p], [asc: p.pinned, desc: p.inserted_at])
    |> preload([:user, :comments])
    |> Repo.all
    |> Enum.map(&update_comments_count/1)
  end

  def get_post(post_id) when is_integer(post_id) do
    Repo.get(Post, post_id)
  end

  def get_post(slug) when is_binary(slug) do
    Repo.get_by(Post, slug: slug)
  end

  defp update_comments_count(post), do: Map.put(post, :comments_count, Enum.count(post.comments))
end
