#!/bin/bash
echo "Launching weave router"
weave launch 10.131.52.115 10.131.52.116 10.131.52.239

echo "Creating Config Server 1"
weave run 10.10.20.100/16 -it --name config1 mongodv5-3 --dbpath /data/db/config1 --configsvr --port 20000

echo "Creating Shard1 Rep1 PRIMARY"
weave run 10.10.30.10/16 -it -p 11000:11000 --name s1rep1 mongodv5-3 --dbpath /data/db/S1repset --shardsvr --port 10000 --rest --replSet S1repset

#echo "Creating Shard2 Rep1 "
#weave run 10.10.30.20/16 -it -p 11002:11001 --name s2rep1 mongodv5-3 --dbpath /data/db/S2repset --shardsvr --port 10001 --rest --replSet S2repset

echo "Creating Shard2 Arbiter "
weave run 10.10.30.40/16 -it -p 11004:11001 --name s2arb mongodv5-3 --dbpath /data/db/arbiter --port 10001 --rest --replSet S2repset --oplogSize 8

echo "Creating Shard3 Rep1 "
weave run 10.10.30.30/16 -it -p 11003:11002 --name s3rep1 mongodv5-3 --dbpath /data/db/S3repset --shardsvr --port 10002 --rest --replSet S3repset

