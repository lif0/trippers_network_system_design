Table publication { // popular publications
  publicatoin_id integer [unique, increment, note: 'Publication id']
  user_id integer [not null, note: 'User id']
  image_url varchar(256) [not null, note: 'Image url of the publicatoin']
  location json [null, note: 'Location object of the publication']
  description varchar(200) [not null, note: 'Description of the publication']
  longitude double [not null, note: 'Longitude of the publication']
  latitude double [not null, note: 'Latitude of the publication']
  count_reaction int [not null, note: 'Count reaction']
}

Table locations { // popular locations
  location_id integer [unique, note: 'Location id']
  location_name varchar(256) [not null, note: 'Location name']
  longitude double [not null, note: 'Longitude of the location']
  latitude double [not null, note: 'Latitude of the location']
  radius integer [not null]
}

Table publication_comments { // comments on popular posts (store only top 300 latest comments)
  id integer [primary key, increment]
  reply integer [null, note: 'A reply to the comment. If filled in, this is a replay to the comment with an ID']
  user_id integer [not null]
  publication_id integer [not null]
  text [not null]
}