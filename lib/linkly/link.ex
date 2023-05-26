defmodule Linkly.Link do
  use Ecto.Schema
  alias Linkly.{Bookmark, LinkTags, Tag, User}

  schema "links" do
    field(:url, :string)
    has_many(:bookmarks, Bookmark)
    has_many(:taggings, LinkTags)
    many_to_many(:tags, Tag, join_through: LinkTags)
    many_to_many(:users, User, join_through: LinkTags)

    timestamps()
  end
end
