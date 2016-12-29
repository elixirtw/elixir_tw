defmodule ElixirTw.Repo.Migrations.AddMarkdownBodyColumnToPosts do
  use Ecto.Migration

  def change do
    alter table(:posts) do
      add :markdown_body, :text
    end
  end
end
