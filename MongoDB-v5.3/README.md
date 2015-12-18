### MongoDB-v5.3 - version mongodb used 3.0
This version is having 3 shards with replication members of three and one arbiter.
 - One Primary
 - Two secondary
 - One arbiter (To help elect a new primary if the primary goes down)

Example:

- Droplet1 have shard1 with replication members of shard1-primary, shard2-secondary, shard3-secondary, shard2-arbiter
- Droplet2 have shard2 with replication members of shard1-secondary, shard2-primary, shard3-secondary, shard3-arbiter
- Droplet3 have shard3 with replication members of shard1-secondary, shard2-secondary, shard3-primary
- Droplet3 have shard3 with replication members of shard1-secondary, shard2-secondary, shard3-secondary, shard1-arbiter
 

- This setup will test how useful of having an arbiter. Check if the primary and one secondary goes down the remaining secondary should be a primary.
- We decided to put the arbiters in the least priority.
     