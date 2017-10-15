defmodule ElixirTw.Repo.Migrations.AddingGuardianTokens do
  use Ecto.Migration

  def change do
    create table(:guardian_tokens, primary_key: false) do
      add :jti, :string, primary_key: true
      add :typ, :string
      add :aud, :string
      add :iss, :string
      add :sub, :string
      add :exp, :bigint
      add :jwt, :text
      add :claims, :map
      timestamps()
    end
    create unique_index(:guardian_tokens, [:jti, :aud])
  end
end
