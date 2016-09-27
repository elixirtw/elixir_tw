defmodule ElixirTw.User do
  use ElixirTw.Web, :model

  alias Ueberauth.Auth
  alias ElixirTw.OauthInfo

  schema "users" do
    has_many :oauth_infos, OauthInfo
    field :name, :string
    field :email, :string
    field :crypted_password, :string

    timestamps
  end

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ %{}) do
    model
    |> cast(params, [:name, :email])
    |> validate_required([:name, :email])
  end

end
