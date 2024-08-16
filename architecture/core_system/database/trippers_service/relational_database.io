enum location_type {
        popular
}

enum reaction_type {
        like,
        fire
}

Table сountries {
  iso integer [primary key, note: 'Country uninq code(ISO)']
  country_name varchar(32) [unique, not null]
}

Table citizenships {
  user_id integer [not null]
  country_id integer [not null]
}

Table users {
  id integer [primary key, increment]
  username varchar(32) [not null]
  email varchar(128) [not null]
  password_hash text [not null]
  created_at timestamp [not null, note: 'Creation time']
}

Table follows {
  following_user_id integer [not null]
  followed_user_id integer [not null]
  created_at timestamp  [not null, note: 'Creation time']
}

Table publicaitons {
  id integer [primary key, increment]
  user_id integer [not null]
  image_id uuid [not null]
  location_id integer [null, note: 'Location ID of the publication']
  description varchar(200) [not null, note: 'Description of the publication']
  longitude double [not null, note: 'Longitude of the publication']
  latitude double [not null, note: 'Latitude of the publication']
  created_at timestamp [not null, note: 'Creation time']
}

Table publication_reactions {
  publication_id integer [not null]
  reaction_id integer [not null]
  count integer [not null]
}

Table reactions_type {
  id integer [primary key, increment]
  reaction_type integer [not null, note: 'Emoji']
}

Table publication_comments {
  user_id integer [not null]
  publication_id integer [not null]
  text varchar(140) [not null]
}

Table locations {
  id integer [primary key, increment]
  location_name varchar(256) [not null, note: 'Location name']
  longitude double [not null, note: 'Longitude of the location']
  latitude double [not null, note: 'Latitude of the location']
  radius integer [not null]
}

// relations
Ref: users.id < follows.following_user_id // one-to-one
Ref: users.id < follows.followed_user_id // one-to-one

Ref: citizenships.user_id > users.id // many-to-one
Ref: citizenships.country_id < сountries.iso // one-to-one

Ref: publicaitons.id < users.id // one-to-one
Ref: publicaitons.location_id < locations.id // one-to-one

Ref: publication_reactions.publication_id < publicaitons.id // one-to-one
Ref: publication_reactions.reaction_id > reactions_type.id // many-to-one

Ref: publication_comments.publication_id < publicaitons.id // one-to-one
Ref: publication_comments.user_id < users.id // one-to-one