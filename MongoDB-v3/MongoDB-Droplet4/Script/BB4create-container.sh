
#!/bin/bash
echo "Launching weave router"
weave launch 10.131.18.210 10.131.20.32 10.131.41.46

echo "Creating Config Server 4"
weave run 10.10.20.130/16 -it --name config4 mongod --dbpath /data/db/config4 --configsvr --port 20000

echo "Creating Rep Set 1 Shard4"
weave run 10.10.60.10/16 -it -p 11012:11000 --name s1rep4 mongod --dbpath /data/db/S1repset --shardsvr --port 10000 --rest --replSet S1repset

echo "Creating Rep Set 2 Shard4"
weave run 10.10.60.20/16 -it -p 11013:11001 --name s2rep4 mongod --dbpath /data/db/S2repset --shardsvr --port 10001 --rest --replSet S2repset

echo "Creating Rep Set 3 Shard4"
weave run 10.10.60.30/16 -it -p 11014:11002 --name s3rep4 mongod --dbpath /data/db/S3repset --shardsvr --port 10002 --rest --replSet S3repset

echo "Creating Rep Set 4 Shard4 Primary"
weave run 10.10.60.40/16 -it -p 11015:11003 --name s4rep4 mongod --dbpath /data/db/S4repset --shardsvr --port 10003 --rest --replSet S4repset
