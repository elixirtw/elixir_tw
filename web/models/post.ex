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
    struct
    |> cast(params, [:title, :slug, :body, :user_id])
    |> build_slug
    |> validate_required([:slug, :user_id])
    |> unique_constraint(:slug)
    |> assoc_constraint(:user)
  end

  defp build_slug(changeset) do
    %{slug: slug, title: title} = changeset.changes
    
    build_slug(slug, title)
    |> fn(slug) -> put_change(changeset, :slug, slug) end.()
  end

  defp build_slug(nil, title), do: "#{slugify_time}-#{slugify_title(title)}"
  defp build_slug(slug, _), do: slug

  defp slugify_time, do: DateTime.utc_now |> DateTime.to_unix |> to_string

  defp slugify_title(nil), do: nil
  defp slugify_title(title) do
    title |> Phoenix.Naming.humanize |> String.downcase |> String.replace(" ", "-")
  end
end
