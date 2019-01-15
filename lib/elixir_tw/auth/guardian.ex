defmodule ElixirTw.Auth.Guardian do
  @moduledoc nil
  use Guardian, otp_app: :elixir_tw

  alias ElixirTw.Account
  alias Account.User

  def subject_for_token(%User{id: user_id}, _claims) do
    {:ok, "User:#{user_id}"}
  end

  def subject_for_token(_, _), do: {:error, :unknown_resource}

  def resource_from_claims(%{"sub" => "User:" <> user_id}) do
    case String.to_integer(user_id) |> Account.get_user() do
      %User{} = user -> {:ok, user}
      _ -> {:error, :resource_not_found}
    end
  end
end
