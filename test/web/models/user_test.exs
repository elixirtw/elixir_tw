defmodule ElixirTw.Web.UserTest do
  use ElixirTw.Web.ModelCase

  alias ElixirTw.Web.User

  @valid_attrs %{email: "some content", crypted_password: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
