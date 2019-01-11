defmodule ElixirTw.Account.GuardianSerializer do
  @moduledoc nil

  alias ElixirTw.Account
  alias Account.User

  def subject_for_token(%User{id: user_id}, _claims) do
    {:ok, "User:" <> user_id}
  end

  def subject_for_token(_, _), do: {:error, :unknown_resource}

  def resource_from_claims(%{"sub" => "User:" <> user_id}) do
    case Account.get_user(user_id) do
      %User{} = user -> {:ok, user}
      _ -> {:error, :resource_not_found}
    end
  end
end
