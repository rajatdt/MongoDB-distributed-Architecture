#!/bin/bash
echo "Launching weave router"
weave launch 10.131.52.119 10.131.52.116 10.131.52.239

echo "Creating Config Server 2"
weave run 10.10.20.110/16 -it --name config2 mongodv5-3 --dbpath /data/db/config2 --configsvr --port 20000

echo "Creating Shard1 Rep2"
weave run 10.10.40.10/16 -it -p 11004:11000 --name s1rep2 mongodv5-3 --dbpath /data/db/S1repset --shardsvr --port 10000 --rest --replSet S1repset

echo "Creating Shard2 Rep2 PRIMARY"
weave run 10.10.40.20/16 -it -p 11006:11001 --name s2rep2 mongodv5-3 --dbpath /data/db/S2repset --shardsvr --port 10001 --rest --replSet S2repset

#echo "Creating Shard3 Rep2"
#weave run 10.10.40.30/16 -it -p 11007:11002 --name s3rep2 mongodv5-3 --dbpath /data/db/S3repset --shardsvr --port 10002 --rest --replSet S3repset


echo "Creating Shard3 Arbiter "
weave run 10.10.40.40/16 -it -p 11009:11002 --name s3arb mongodv5-3 --dbpath /data/db/arbiter --shardsvr --port 10002 --rest --replSet S3repset

