defmodule ElixirTw.OauthCredential do
  use ElixirTw.Web, :model

  schema "oauth_credentials" do
    field :provider_name, :string
    field :provider_id, :string
    belongs_to :user, ElixirTw.User

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:provider_name, :provider_id])
    |> validate_required([:provider_name, :provider_id])
  end
end
