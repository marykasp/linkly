defmodule Linkly.Tag do
  use Ecto.Schema
  alias Linkly.{Link, User, LinkTags}

  schema "tags" do
    field(:title)
    has_many(:taggings, LinkTags)
    many_to_many(:users, User, join_through: LinkTags)
    many_to_many(:links, Link, join_through: LinkTags)

    timestamps()
  end
end
