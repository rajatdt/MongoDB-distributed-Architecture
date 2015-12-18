### MongoDB-v4 - version mongodb used 2.4
This version is having 3 shards with replication of each shard in three different droplet of digital ocean that have concept of primary and secondary of replication. 

Example:

- Droplet1 have shard1 with replication members of shard1-primary, shard2-secondary, shard3-secondary
- Droplet2 have shard2 with replication members of shard1-secondary, shard2-primary, shard3-secondary
- Droplet3 have shard3 with replication members of shard1-secondary, shard2-secondary, shard3-primary

Somehow this approach not worked - The replication member for shards need to be the same member name
