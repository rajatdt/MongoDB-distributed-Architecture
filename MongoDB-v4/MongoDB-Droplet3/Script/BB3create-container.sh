#!/bin/bash
echo "Launching weave router"
weave launch 10.131.41.46 10.131.18.210 10.131.43.53

echo "Creating Config Server 3"
weave run 10.10.20.120/16 -it --name config3 mongodv2 --dbpath /data/db/config3 --configsvr --port 20000

echo "Creating Rep Member 1 Shard3"
weave run 10.10.50.10/16 -it -p 11008:11000 --name ss1 mongodv2 --dbpath /data/db/ss1 --shardsvr --port 10000 --rest --replSet shard3

echo "Creating Rep Member 2 Shard3"
weave run 10.10.50.20/16 -it -p 11009:11001 --name ss2 mongodv2 --dbpath /data/db/ss2 --shardsvr --port 10001 --rest --replSet shard3
 
echo "Creating Rep Member 3 Shard3 PRIMARY"
weave run 10.10.50.30/16 -it -p 11010:11002 --name ps3 mongodv2 --dbpath /data/db/ps3 --shardsvr --port 10002 --rest --replSet shard3