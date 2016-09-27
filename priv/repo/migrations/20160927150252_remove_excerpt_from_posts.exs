defmodule ElixirTw.Repo.Migrations.RemoveExcerptFromPosts do
  use Ecto.Migration

  def change do
    alter table(:posts) do
      remove :excerpt
    end
  end
end
