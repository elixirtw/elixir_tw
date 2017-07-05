defmodule ElixirTw.Board.Post do
  @moduledoc false

  use ElixirTw.Web, :schema
  use PipeTo.Override

  schema "posts" do
    field :title, :string
    field :slug, :string
    field :body, :string
    field :markdown_body, :string
    belongs_to :user, ElixirTw.Account.User
    has_many :comments, ElixirTw.Comment

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :markdown_body, :user_id])
    |> build_slug
    |> translate_markdown
    |> validate_required([:title, :markdown_body, :user_id])
    |> unique_constraint(:slug)
    |> assoc_constraint(:user)
  end

  defp translate_markdown(changeset = %{changes: %{markdown_body: md_body}}) do
    case Earmark.as_html(md_body) do
      {:ok, html_body, []} ->
        html_body
        |> HtmlSanitizeEx.basic_html
        |> put_change(changeset, :body, _)
      {:error, _, _} -> add_error(changeset, :body, "markdown 轉換失敗")
    end
  end
  defp translate_markdown(changeset), do: changeset

  defp build_slug(changeset = %{changes: %{title: title}}), do: put_change(changeset, :slug, title_to_slug(title))
  defp build_slug(changeset), do: changeset

  defp title_to_slug(title), do: "#{slugify_time()}-#{slugify_title(title)}"

  defp slugify_time, do: DateTime.utc_now |> DateTime.to_unix |> to_string

  defp slugify_title(nil), do: nil
  defp slugify_title(title) do
    title |> Phoenix.Naming.humanize |> String.downcase |> String.replace(" ", "-")
  end
end
