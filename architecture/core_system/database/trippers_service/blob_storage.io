// Replication:
// - master-slave (async)
// - replication factor 2
//
// Sharding:
// - key based by user_id

Table files {
  file_id uuid [not null]
  path text [not null]
}