defmodule Linkly.Link do
  use Ecto.Schema
  alias Linkly.Bookmark

  schema "links" do
    field(:url, :string)
    has_many(:bookmarks, Bookmark)

    timestamps()
  end
end
