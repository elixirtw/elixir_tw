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

  def get_post(slug, opts \\ [])
  def get_post(slug, opts) do
    preload = Keyword.get(opts, :preload) || []
    Post
    |> Repo.get_by(slug: slug)
    |> Repo.preload(preload)
  end

  defp update_comments_count(post), do: Map.put(post, :comments_count, Enum.count(post.comments))
end
