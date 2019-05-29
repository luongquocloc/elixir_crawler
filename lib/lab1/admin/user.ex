defmodule Lab1.Admin.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "user" do
    field :user, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:user])
    |> validate_required([:user])
  end
end
