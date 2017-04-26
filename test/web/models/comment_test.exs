defmodule ElixirTw.Web.CommentTest do
  use ElixirTw.Web.ModelCase

  alias ElixirTw.Web.Comment

  @valid_attrs %{body: "some content", position: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Comment.changeset(%Comment{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Comment.changeset(%Comment{}, @invalid_attrs)
    refute changeset.valid?
  end
end
