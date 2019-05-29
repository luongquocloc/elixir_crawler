defmodule Lab1.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:user) do
      add :user, :string

      timestamps()
    end

  end
end
