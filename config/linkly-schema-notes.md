# Linkly Schema (Delicious Clone)
- bookmark links, and see what followers/friends also bookmarked, can also tag bookmarks and search
through tags of other people and your own

### user
- username
- email

### link
- url

### bookmark
- title
- link_id, refers to links
- user_id, refers to users

### tag
- title

### link_tags
- link_id
- tag_id
- user_id

### interests
- tag_id
- user_id

### follows
- following_id (:user)
- follower_id (:user)

# Ecto Assocations

The easy way to remember which schema "belongs" to the other and which "has" the other,
is that each schema **belongs to whatever foreign keys are in it**

The bookmarks belongs to both links (link_id) and users (user_id). By updating the
schema to replace the foreign keys lines with `belongs_to/2` we can create
assocations with Ecto.

**Preloading** a `has_many` assocation works exactly the same as `belongs_to`:
```ecto
link1 = Repo.get!(Link, 1)
link1 |> Repo.preload([:bookmarks])
```

Nested preloads - nesting the list we pass to the preload function

`Repo.preload(link1, [bookmarks: [:user]])`

# `put`, `cast`, `embed` Associations

`put_assc` - puts the given association entry or entries as a change in the changeset

`put_embed` - puts the given embed entry as a change in the changeset

In Ecto there are two kinds of schemaas, those backed by tables in a database and
those that are not. The ones that are not are called *embedded* schemas, you can
tell them apart in the way that you define them. Define an embedded schema with `embedded-schema`

Both types of schemas can have relations to other schemas. Table backed ones have
`assocations`, these has `has_one`, `has_many`, `belongs_to`.

Embedded Schemas have `embeds`, `embeds_one`, `embeds_many` other embedded schemas.

`put_assoc` works on associations (relations between table backed schemas)
`put_embeds` works on embeds (relations between non table backed schemas)

## Ecto.Changeset
`Ecto.Changeset.cast` takes the fields on the data passed in and compares it to what the schema
says it should be, then attempts to coerce it to that type if it can.

Then ecto can convert say a string data point (date) to an actual date

`cast` casts the data.

`cast_embed` -> adds an embed as a change to a change  set, casting the data on the
relation as it goes.
`put_embed` -> adds the embed as a change to the changeset, without casting
any fields

`cast_assoc` -> adds an association as a change to a changeset, casting the fields
to the types they should be as it goes.
`put_assoc` -> adds an association as a change to a changeset, without casting any of
the fields.
