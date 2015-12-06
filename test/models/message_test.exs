defmodule Elixirtaipei.MessageTest do
  use Elixirtaipei.ModelCase

  alias Elixirtaipei.Message

  @valid_attrs %{content: "some content", file_type: "some content", member: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Message.changeset(%Message{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Message.changeset(%Message{}, @invalid_attrs)
    refute changeset.valid?
  end
end
