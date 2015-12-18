#!/bin/bash
echo "Launching weave router"
weave launch 104.236.166.71 162.243.144.5

echo "Creating Config Server 2"
weave run 10.10.20.110/16 -it --name config2 mongodv5-1 --dbpath /data/db/config2 --configsvr --port 20000

echo "Creating Shard1 Rep2"
weave run 10.10.40.10/16 -it -p 11004:11000 --name s1rep2 mongodv5-1 --dbpath /data/db/S1repset --shardsvr --port 10000 --rest --replSet S1repset

echo "Creating Shard2 Rep2 PRIMARY"
weave run 10.10.40.20/16 -it -p 11005:11001 --name s2rep2 mongodv5-1 --dbpath /data/db/S2repset --shardsvr --port 10001 --rest --replSet S2repset
