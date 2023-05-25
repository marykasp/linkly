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
