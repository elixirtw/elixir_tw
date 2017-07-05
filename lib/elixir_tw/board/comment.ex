defmodule ElixirTw.Board.Comment do
  @moduledoc nil

  use ElixirTw.Web, :schema

  schema "comments" do
    field :body, :string
    field :position, :integer
    belongs_to :post, ElixirTw.Post
    belongs_to :user, ElixirTw.User

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:body, :position])
    |> validate_required([:body, :position])
  end
end
