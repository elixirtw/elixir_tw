defmodule ElixirTw.Repo.Migrations.CreateComment do
  use Ecto.Migration

  def change do
    create table(:comments) do
      add :body, :text
      add :position, :integer, default: 1
      add :post_id, references(:posts, on_delete: :nothing)
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end
    create index(:comments, [:post_id])
    create index(:comments, [:user_id])
  end
end
