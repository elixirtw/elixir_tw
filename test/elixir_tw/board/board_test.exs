defmodule ElixirTw.BoardTest do
  use ElixirTw.DataCase, async: true

  alias ElixirTw.Board
  alias ElixirTw.Board.Post

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

    test "get post by slug", context do
      post = Board.get_post(context.post.slug)

      assert post.id == context.post.id
      assert post.user_id == context.post.user_id
    end
  end

  describe "get_post/2" do
    setup do
      %{post: insert(:post)}
    end

    test "preloads user", context do
      post = Board.get_post(context.post.slug, preload: :user)

      assert post.user == context.post.user
    end
  end

  describe "get_post_by_user/2" do
    setup do
      %{post: insert(:post)}
    end

    test "get the post scoping to the user", context do
      assert Board.get_post_by_user(context.post.user, context.post.slug)
    end

    test "does not get post from another user", context do
      refute Board.get_post_by_user(insert(:user), context.post.slug)
    end
  end

  describe "post_changeset/0" do
    test "build an empty post changeset" do
      cs = Board.post_changeset()
      assert cs.__struct__() == Ecto.Changeset
      assert cs.data.__struct__() == ElixirTw.Board.Post
    end
  end

  describe "post_changeset/1" do
    test "builds an empty post changeset" do
      post_params = params_for(:post)
      cs = Board.post_changeset(post_params)

      assert cs.changes.title == post_params.title
      assert cs.data.slug == nil
    end
  end

  describe "post_changeset/2" do
    test "builds a post changeset with existing post struct" do
      post_params = params_for(:post)
      user = insert(:user)
      cs = Board.post_changeset(%Post{user_id: user.id, slug: "42-answer-to-life"}, post_params)

      assert cs.data.slug == "42-answer-to-life"
      assert cs.data.user_id == user.id
      assert cs.changes.title == post_params.title
    end
  end

  describe "create_post/2" do
    setup do
      %{post_param: params_for(:post), user: insert(:user)}
    end

    test "creates post from param with given user", context do
      assert {:ok, post} = Board.create_post(context.user, context.post_param)
      assert post.user_id == context.user.id
      assert post.slug
    end
  end

  describe "update_post/3" do
    setup do
      %{post: insert(:post)}
    end

    test "creates post from param with given user", context do
      post_param = %{markdown_body: "hmmmm foo foo bar bar"}
      assert {:ok, post} = Board.update_post(context.post.user, context.post.slug, post_param)
      assert post.user_id == context.post.user_id
    end
  end
end
