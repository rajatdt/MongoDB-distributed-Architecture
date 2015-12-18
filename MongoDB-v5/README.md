### MongoDB-v5 - version mongodb used 3.0
This version is having 2 shards with replication of each shard in three different droplet of digital ocean that have concept of primary and secondary of replication. 

Example:

- Droplet1 have shard1 with replication members of shard1-primary, shard2-secondary
- Droplet2 have shard2 with replication members of shard1-secondary, shard2-primary
- Droplet3 have shard3 with replication members of shard1-secondary, shard2-secondary

- "OnTest" - Going to use higher memory, disk space and transfer
- See if balancing change or the same