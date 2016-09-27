defmodule ElixirTw.Post do
  use ElixirTw.Web, :model

  schema "posts" do
    field :title, :string
    field :slug, :string
    field :body, :string
    belongs_to :user, ElixirTw.User

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    params = build_slug(params)
    struct
    |> cast(params, [:title, :slug, :body])
    |> validate_required(:slug)
    |> unique_constraint(:slug)
  end

  defp build_slug(%{slug: nil}=struct), do: Map.update!(struct, :slug, "#{slugify_time}-#{slugify_title(Map.get(struct, :title, ""))}")
  defp build_slug(%{slug: _}=struct), do: struct
  defp build_slug(struct), do: Map.put_new(struct, :slug, "#{slugify_time}-#{slugify_title(Map.get(struct, :title, ""))}")


  defp slugify_time, do: DateTime.utc_now |> DateTime.to_unix |> to_string
  defp slugify_title(title), do: title |> Phoenix.Naming.humanize |> String.replace(" ", "-")
end
