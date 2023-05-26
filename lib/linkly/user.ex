defmodule Linkly.User do
  use Ecto.Schema
  alias Linkly.{Bookmark, Link}

  schema "users" do
    field(:about)
    field(:username, :string)
    field(:email, :string)
    has_many(:bookmarks, Bookmark)
    has_many(:bookmarked_links, through: [:bookmarks, :link])

    timestamps()
  end
end
