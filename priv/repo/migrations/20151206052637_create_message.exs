defmodule ElixirTW.Repo.Migrations.CreateMessage do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add :member, :string
      add :content, :text
      add :file_type, :string

      timestamps
    end

  end
end
