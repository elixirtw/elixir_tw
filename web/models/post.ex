defmodule ElixirTw.Post do
  use ElixirTw.Web, :model

  schema "posts" do
    field :title, :string
    field :slug, :string
    field :body, :string
    field :excerpt, :string
    belongs_to :user, ElixirTw.User

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :slug, :body, :excerpt])
    |> validate_required([:title, :slug, :body, :excerpt])
    |> unique_constraint(:slug)
  end
end
