defmodule ElixirTw.Repo.Migrations.MakingPostsUserIdNotNull do
  use Ecto.Migration

  def up do
    alter table(:posts) do
      modify :user_id, :integer, null: false
    end
  end
  def down do
    alter table(:posts) do
      modify :user_id, :integer, null: true
    end
  end
end
