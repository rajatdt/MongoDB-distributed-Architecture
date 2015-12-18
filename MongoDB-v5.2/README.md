### MongoDB-v3 - version mongodb used 2.4
This version is having 4 shards with replication of each shard in four different droplet of digital ocean that have primary and secondary of replication.

- If the Primary Shard1 goes down, the members of this replication set should vote who will be the next primary and have the same data from the previous Primary.

Example:

- Droplet1 have shard1-4 with replication members of shard1-primary, shard2-secondary, shard3-secondary, shard4-secondary
- Droplet2 have shard1-4 with replication members of shard1-secondary, shard2-primary, shard3-secondary, shard4-secondary
- Droplet3 have shard1-4 with replication members of shard1-secondary, shard2-secondary, shard3-primary, shard4-secondary
- Droplet4 have shard1-4 with replication members of shard1-secondary, shard2-secondary, shard3-secondary, shard4-primary

This approach is the most stable - which gives high availability of our data but unsure for scalability
The balancing data in different shard seems slow