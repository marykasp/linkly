defmodule Linkly.User do
  use Ecto.Schema

  schema "users" do
    field(:about)
    field(:username, :string)
    field(:email, :string)

    timestamps()
  end
end
