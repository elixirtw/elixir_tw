defmodule ElixirTw.Repo.Migrations.CreatePost do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string
      add :slug, :string
      add :body, :text
      add :excerpt, :text
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end
    create unique_index(:posts, [:slug])
    create index(:posts, [:user_id])

  end
end
