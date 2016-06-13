defmodule ElixirTw.UerTest do
  use ElixirTw.ModelCase

  alias ElixirTw.Uer

  @valid_attrs %{display_name: "some content", email: "some content", password_hash: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Uer.changeset(%Uer{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Uer.changeset(%Uer{}, @invalid_attrs)
    refute changeset.valid?
  end
end
