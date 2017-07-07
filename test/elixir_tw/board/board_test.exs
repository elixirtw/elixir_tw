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

  describe "post_changeset/0" do
    test "output an empty post changeset" do
      changeset = Board.post_changeset
      assert changeset.__struct__ == Ecto.Changeset
      assert changeset.data.__struct__ == Post
    end
  end

  describe "post_changeset/1" do
    test "builds an empty post changeset" do
      with post_params <- params_for(:post),
        post_changeset <- Board.post_changeset(post_params)
      do
        assert post_changeset.changes.title == post_params.title
        assert post_changeset.data.slug == nil
      end
    end
  end

  describe "post_changeset/2" do
    test "builds a post changeset with existing post struct" do
      with post_params <- params_for(:post),
        user <- insert(:user),
        post_changeset <- Board.post_changeset(%Post{user_id: user.id, slug: "42-answer-to-life"}, post_params)
      do
        assert post_changeset.data.slug == "42-answer-to-life"
        assert post_changeset.data.user_id == user.id
        assert post_changeset.changes.title == post_params.title
      end
    end
  end

  describe "create_post/2" do
    setup do
      %{post_param: params_for(:post), user: insert(:user)}
    end

    test "creates post from param with given user", context do
      assert {:ok, post} = Board.create_post(context.post_param, context.user.id)
      assert post.user_id == context.user.id
      assert post.slug
    end
  end
end
