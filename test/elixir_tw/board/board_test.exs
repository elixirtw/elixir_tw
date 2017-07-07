defmodule ElixirTw.BoardTest do
  use ElixirTw.DataCase, async: true

  alias ElixirTw.Board

  describe "get_posts/0" do
    setup do
      count = 3
      %{posts: insert_list(count, :post), count: count}
    end

    test "gets all posts", context do
      posts = Board.get_posts()

      assert Enum.count(posts) == context.count
    end
  end

  describe "get_post/1" do
    setup do
      %{post: insert(:post)}
    end

    test "get post by id", context do
      post = Board.get_post(context.post.id)

      assert post.id == context.post.id
      assert post.user_id == context.post.user_id
    end

    test "get post by slug", context do
      post = Board.get_post(context.post.slug)

      assert post.id == context.post.id
      assert post.user_id == context.post.user_id
    end
  end
end
