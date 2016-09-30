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
    |> validate_required([:title, :slug, :body])
    |> unique_constraint(:slug)
  end

  defp build_slug(%{slug: slug} = struct) when not is_nil(slug) do
    struct
  end

  defp build_slug(struct) do
    title = Map.get(struct, :title, "")
    Map.put(struct, :slug, "#{slugify_time}-#{slugify_title(title)}")
  end

  defp slugify_time, do: DateTime.utc_now |> DateTime.to_unix |> to_string

  defp slugify_title(nil), do: nil
  defp slugify_title(title) do
    title |> Phoenix.Naming.humanize |> String.replace(" ", "-")
  end
end
