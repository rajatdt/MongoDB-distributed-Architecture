#!/bin/bash
echo "Launching weave router"
weave launch 10.131.41.46 10.131.20.32 10.131.43.53

echo "Creating Config Server 2"
weave run 10.10.20.110/16 -it --name config2 mongodv2 --dbpath /data/db/config2 --configsvr --port 20000

echo "Creating Shard2 Rep Member 1"
weave run 10.10.40.10/16 -it -p 11004:11000 --name ss1 mongodv2 --dbpath /data/db/ss1 --shardsvr --port 10000 --rest --replSet shard2

echo "Creating Shard2 Rep Member 2 PRIMARY"
weave run 10.10.40.20/16 -it -p 11005:11001 --name ps2 mongodv2 --dbpath /data/db/ps2 --shardsvr --port 10001 --rest --replSet shard2

echo "Creating Shard2 Rep Member 3"
weave run 10.10.40.30/16 -it -p 11006:11002 --name ss3 mongodv2 --dbpath /data/db/ss3 --shardsvr --port 10002 --rest --replSet shard2
