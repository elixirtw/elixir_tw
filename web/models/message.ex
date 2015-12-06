defmodule Elixirtaipei.Message do
  use Elixirtaipei.Web, :model

  schema "messages" do
    field :member, :string
    field :content, :string
    field :file_type, :string

    timestamps
  end

  @required_fields ~w(member content file_type)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
