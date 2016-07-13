defmodule ElixirTw.Repo.Migrations.ChangeOauthTerms do
  use Ecto.Migration

  def change do
    rename table(:oauth_credentials), :provider_id, to: :uid
    rename table(:oauth_credentials), :provider_name, to: :provider
    rename table(:oauth_credentials), to: table(:oauth_infos)
  end
end
