defmodule Linkly.LinkTags do
  use Ecto.Schema
  alias Linkly.{Link, Tag, User}

  schema "link_tags" do
    belongs_to(:link, Link)
    belongs_to(:user, User)
    belongs_to(:tag, Tag)

    timestamps()
  end
end
