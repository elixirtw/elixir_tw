defmodule ElixirTw.Repo.Migrations.CreateUer do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :display_name, :string
      add :email, :string
      add :password_hash, :string

      timestamps
    end

  end
end
