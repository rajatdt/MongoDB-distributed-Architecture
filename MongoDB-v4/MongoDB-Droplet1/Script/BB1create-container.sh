#!/bin/bash
echo "Launching weave router"
weave launch 10.131.18.210 10.131.20.32 10.131.43.53

echo "Creating Config Server 1"
weave run 10.10.20.100/16 -it --name config1 mongodv2 --dbpath /data/db/config1 --configsvr --port 20000

echo "Creating Shard1 Rep1 PRIMARY"
weave run 10.10.30.10/16 -it -p 11000:11000 --name ps1 mongodv2 --dbpath /data/db/ps1 --shardsvr --port 10000 --rest --replSet shard1

echo "Creating Shard1 Rep 2 "
weave run 10.10.30.20/16 -it -p 11001:11001 --name ss2 mongodv2 --dbpath /data/db/ss2 --shardsvr --port 10001 --rest --replSet shard1

echo "Creating Shard1 Rep 3"
weave run 10.10.30.30/16 -it -p 11002:11002 --name ss3 mongodv2 --dbpath /data/db/ss3 --shardsvr --port 10002 --rest --replSet shard1