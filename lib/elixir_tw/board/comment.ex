defmodule ElixirTw.Board.Comment do
  @moduledoc nil

  use ElixirTw.Web, :schema

  alias ElixirTw.Board
  alias ElixirTw.Account

  schema "comments" do
    field :body, :string
    field :position, :integer
    belongs_to :post, Board.Post
    belongs_to :user, Account.User

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
