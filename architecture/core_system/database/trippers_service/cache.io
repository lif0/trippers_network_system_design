Table popular_publication {
  publicatoin_id integer [unique, increment, note: 'Publication id']
  user_id integer [not null, note: 'User id']
  image_url varchar(256) [not null, note: 'Image url of the publicatoin']
  location json [null, note: 'Location object of the publication']
  description varchar(200) [not null, note: 'Description of the publication']
  longitude double [not null, note: 'Longitude of the publication']
  latitude double [not null, note: 'Latitude of the publication']
  reactions json [not null, note: 'Reactions of the publication']
}

Table popular_locations {
  location_id integer [unique, note: 'Location id']
  location_name varchar(256) [not null, note: 'Location name']
  longitude double [not null, note: 'Longitude of the location']
  latitude double [not null, note: 'Latitude of the location']
}

Table popular_comments {
  publication_id integer [unique, note: 'Publicatoin id']
  comments json [not null, note: 'Last 40 comments of the publication']
}