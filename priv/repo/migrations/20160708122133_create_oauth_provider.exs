defmodule ElixirTw.Repo.Migrations.CreateOauthProvider do
  use Ecto.Migration

  def change do
    create table(:oauth_providers) do
      add :provider_name, :string
      add :provider_id, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end
    create index(:oauth_providers, [:user_id])

  end
end
