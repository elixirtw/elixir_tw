defmodule ElixirTw.Account.User do
  @moduledoc nil

  use ElixirTw.Web, :schema

  # alias Ueberauth.Auth

  schema "users" do
    has_many :oauth_infos, ElixirTw.Account.OAuthInfo
    has_many :posts, ElixirTw.Post
    field :name, :string
    field :email, :string
    field :crypted_password, :string

    timestamps()
  end

  @doc """
  Creates a changeset based on the `struct` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :email])
    |> validate_required([:name, :email])
  end

end
