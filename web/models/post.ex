defmodule ElixirTw.Post do
  use ElixirTw.Web, :model

  schema "posts" do
    field :title, :string
    field :slug, :string
    field :body, :string
    field :markdown_body, :string
    belongs_to :user, ElixirTw.User
    has_many :comments, ElixirTw.Comment

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, ~w/title markdown_body user_id/, ~w/slug/)
    |> build_slug
    |> translate_markdown
    |> validate_required([:title, :slug, :user_id])
    |> unique_constraint(:slug)
    |> assoc_constraint(:user)
  end

  defp translate_markdown(changeset = %{changes: %{markdown_body: md_body}}) do
    put_change(changeset, :body, md_body |> Earmark.to_html |> HtmlSanitizeEx.basic_html)
  end

  defp translate_markdown(changeset), do: changeset
  # NOTE Earmark said to use as_html, but somehow it's not yet implemented, using the older to_html version for now
  #defp translate_markdown(changeset = %{changes: %{markdown_body: md_body}}) do
    #case Earmark.as_html(md_body) do
      #{:ok, html_body} -> put_change(changeset, :body, html_body)
      #{:error, _, _} -> add_error(changeset, :body, "markdown 轉換失敗")
    #end
  #end

  defp build_slug(changeset = %{changes: %{title: title}}), do: put_change(changeset, :slug, title_to_slug(title))
  defp build_slug(changeset), do: changeset

  defp title_to_slug(title), do: "#{slugify_time}-#{slugify_title(title)}"

  defp slugify_time, do: DateTime.utc_now |> DateTime.to_unix |> to_string

  defp slugify_title(nil), do: nil
  defp slugify_title(title) do
    title |> Phoenix.Naming.humanize |> String.downcase |> String.replace(" ", "-")
  end
end
