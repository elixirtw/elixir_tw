defmodule ElixirTw.Account.OAuthInfo do
  @moduledoc false

  use ElixirTw.Web, :schema

  schema "oauth_infos" do
    field :provider, :string
    field :uid, :string
    belongs_to :user, ElixirTw.Account.User

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:uid, :provider])
    |> validate_required([:provider, :uid])
  end
end
