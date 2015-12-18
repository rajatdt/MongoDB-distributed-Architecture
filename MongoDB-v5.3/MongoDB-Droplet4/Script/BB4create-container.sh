#!/bin/bash
echo "Launching weave router"
weave launch 10.131.52.119 10.131.52.115 10.131.52.116

#echo "Creating Shard1 Rep4"
#weave run 10.10.60.10/16 -it -p 11008:11000 --name s1rep4 mongodv5-3 --dbpath /data/db/S1repset --shardsvr --port 10000 --rest --replSet S1repset

echo "Creating Shard1 Arbiter "
weave run 10.10.60.40/16 -it -p 11012:11000 --name s1arb mongodv5-3 --dbpath /data/db/arbiter --port 10000 --rest --replSet S1repset --oplogSize 8

echo "Creating Shard2 Rep4"
weave run 10.10.60.20/16 -it -p 11009:11001 --name s2rep4 mongodv5-3 --dbpath /data/db/S2repset --shardsvr --port 10001 --rest --replSet S2repset

echo "Creating Shard3 Rep4"
weave run 10.10.60.30/16 -it -p 11010:11002 --name s3rep4 mongodv5-3 --dbpath /data/db/S3repset --shardsvr --port 10002 --rest --replSet S3repset



