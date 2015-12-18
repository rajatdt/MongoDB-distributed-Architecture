#!/bin/bash
echo "Launching weave router"
weave launch 10.131.41.46 10.131.18.210 10.131.43.53

echo "Creating Config Server 3"
weave run 10.10.20.120/16 -it --name config3 mongod --dbpath /data/db/config3 --configsvr --port 20000

echo "Creating Rep Set 1 Shard3"
weave run 10.10.50.10/16 -it -p 11008:11000 --name s1rep3 mongod --dbpath /data/db/S1repset --shardsvr --port 10000 --rest --replSet S1repset

echo "Creating Rep Set 2 Shard3"
weave run 10.10.50.20/16 -it -p 11009:11001 --name s2rep3 mongod --dbpath /data/db/S2repset --shardsvr --port 10001 --rest --replSet S2repset
 
echo "Creating Rep Set 3 Shard3 PRIMARY"
weave run 10.10.50.30/16 -it -p 11010:11002 --name s3rep3 mongod --dbpath /data/db/S3repset --shardsvr --port 10002 --rest --replSet S3repset

echo "Creating Rep Set 4 Shard3"
weave run 10.10.50.40/16 -it -p 11011:11003 --name s4rep3 mongod --dbpath /data/db/S4repset --shardsvr --port 10003 --rest --replSet S4repset
