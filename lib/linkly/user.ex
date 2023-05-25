defmodule Linkly.User do
  use Ecto.Schema
  alias Linkly.Bookmark

  schema "users" do
    field(:about)
    field(:username, :string)
    field(:email, :string)
    has_many(:bookmarks, Bookmark)

    timestamps()
  end
end
