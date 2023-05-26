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
