#!/bin/bash
echo "Launching weave router"
weave launch 10.131.52.119 10.131.52.115 10.131.52.239

echo "Creating Config Server 3"
weave run 10.10.20.120/16 -it --name config3 mongodv5-3 --dbpath /data/db/config3 --configsvr --port 20000

echo "Creating Shard1 Rep3"
weave run 10.10.50.10/16 -it -p 11008:11000 --name s1rep3 mongodv5-3 --dbpath /data/db/S1repset --shardsvr --port 10000 --rest --replSet S1repset

echo "Creating Shard2 Rep3"
weave run 10.10.50.20/16 -it -p 11009:11001 --name s2rep3 mongodv5-3 --dbpath /data/db/S2repset --shardsvr --port 10001 --rest --replSet S2repset

echo "Creating Shard3 Rep3 "
weave run 10.10.50.30/16 -it -p 11010:11002 --name s3rep3 mongodv5-3 --dbpath /data/db/S3repset --shardsvr --port 10002 --rest --replSet S3repset

