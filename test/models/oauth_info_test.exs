defmodule ElixirTw.OAuthInfoTest do
  use ElixirTw.ModelCase

  alias ElixirTw.OAuthInfo

  @valid_attrs %{uid: "some content", provider: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = OAuthInfo.changeset(%OAuthInfo{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = OAuthInfo.changeset(%OAuthInfo{}, @invalid_attrs)
    refute changeset.valid?
  end
end
