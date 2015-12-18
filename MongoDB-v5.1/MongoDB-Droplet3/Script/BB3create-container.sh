#!/bin/bash
echo "Launching weave router"
weave launch 162.243.144.5 45.55.3.22 

echo "Creating Config Server 3"
weave run 10.10.20.120/16 -it --name config3 mongodv5-1 --dbpath /data/db/config3 --configsvr --port 20000

echo "Creating Rep Set 1 Shard3"
weave run 10.10.50.10/16 -it -p 11008:11000 --name s1rep3 mongodv5-1 --dbpath /data/db/S1repset --shardsvr --port 10000 --rest --replSet S1repset

echo "Creating Rep Set 2 Shard3"
weave run 10.10.50.20/16 -it -p 11009:11001 --name s2rep3 mongodv5-1 --dbpath /data/db/S2repset --shardsvr --port 10001 --rest --replSet S2repset