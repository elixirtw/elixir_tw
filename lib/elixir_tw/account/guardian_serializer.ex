defmodule ElixirTw.Account.GuardianSerializer do
  @moduledoc nil

  @behaviour Guardian.Serializer

  alias ElixirTw.Repo
  alias ElixirTw.Account.User

  def for_token(%User{} = user), do: {:ok, "User:#{user.id}"}
  def for_token(_), do: {:error, "Unknown resource type"}

  def from_token("User:" <> id), do: {:ok, Repo.get(User, id)}
  def from_token(_), do: {:error, "Unknown resource type"}
end
