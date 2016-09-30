defmodule ElixirTw.Repo.Migrations.AddingPinedToPosts do
  use Ecto.Migration

  def change do
    alter table(:posts) do
      add :pinned, :boolean, default: false
    end
  end
end
