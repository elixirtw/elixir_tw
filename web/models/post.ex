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
    |> build_slug
    |> build_excerpt
    |> validate_required([:slug])
    |> unique_constraint(:slug)
  end

  defp build_slug(%{title: title, slug: nil}=struct), do: struct |> Map.update!(:slug, "#{slugify_time}-#{slugify_title(title)}")
  defp build_slug(struct), do: struct

  defp slugify_time, do: DateTime.utc_now |> DateTime.to_unix |> to_string
  defp slugify_title(title), do: title |> Phoenix.Naming.humanize |> String.replace(" ", "-")
  defp slugify_title(_), do: ""

  defp build_excerpt(%{body: body, excerpt: nil}=struct), do: struct |> Map.update!(:excerpt, excerptify_body(body))
  defp build_excerpt(struct), do: struct

  defp excerptify_body(body), do: body |> String.slice(0, 150)
end
