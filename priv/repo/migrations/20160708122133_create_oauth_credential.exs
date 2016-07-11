defmodule ElixirTw.Repo.Migrations.CreateOauthCredential do
  use Ecto.Migration

  def change do
    create table(:oauth_credentials) do
      add :provider_name, :string
      add :provider_id, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end
    create index(:oauth_credentials, [:user_id])

  end
end
