defmodule ElixirTw.PostTest do
  use ElixirTw.ModelCase

  alias ElixirTw.Post

  @valid_attrs %{user_id: "1", body: "some content", slug: "some slug", title: "some title"}
  @attrs_without_slug %{user_id: "1", body: "some content", title: "some title"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Post.changeset(%Post{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Post.changeset(%Post{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "changeset with slug" do
    changeset = Post.changeset(%Post{}, @valid_attrs)
    assert get_field(changeset, :slug) == "some slug"
  end

  test "changeset without slug should use title" do
    changeset = Post.changeset(%Post{}, @attrs_without_slug)
    assert get_field(changeset, :slug) =~ ~r/some-title/
  end
end
