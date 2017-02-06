defmodule ElixirTw.PostTest do
  use ElixirTw.ModelCase

  alias ElixirTw.Post

  @valid_attrs %{user_id: "1", markdown_body: "some content", title: "some title"}
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
    assert get_field(changeset, :slug) =~ ~r(^[0-9]{10}-some-title$)
  end
end
