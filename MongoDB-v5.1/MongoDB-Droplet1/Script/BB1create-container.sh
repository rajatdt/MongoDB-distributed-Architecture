#!/bin/bash
echo "Launching weave router"
weave launch 104.236.166.71 45.55.3.22

echo "Creating Config Server 1"
weave run 10.10.20.100/16 -it --name config1 mongodv5-1 --dbpath /data/db/config1 --configsvr --port 20000

echo "Creating Shard1 Rep1 PRIMARY"
weave run 10.10.30.10/16 -it -p 11000:11000 --name s1rep1 mongodv5-1 --dbpath /data/db/S1repset --shardsvr --port 10000 --rest --replSet S1repset

echo "Creating Shard2 Rep1 "
weave run 10.10.30.20/16 -it -p 11001:11001 --name s2rep1 mongodv5-1 --dbpath /data/db/S2repset --shardsvr --port 10001 --rest --replSet S2repset


