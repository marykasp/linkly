defmodule Linkly.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :string
      add :email, :string
      add :about, :text

      timestamps()
    end

    create unique_index(:users, [:email, :username])
    create unique_index(:users, [:username, :username])
  end
end
