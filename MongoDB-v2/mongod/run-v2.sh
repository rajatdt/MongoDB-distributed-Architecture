#!/bin/bash

# Run processes for the cluster
# Running on a single dev machine as a demo

mkdir a0
mkdir a1
mkdir a2
mkdir b0
mkdir b1
mkdir b2
mkdir c0
mkdir c1
mkdir c2
mkdir d1
mkdir d2
mkdir d3

mkdir cfg0
mkdir cfg1
mkdir cfg2

# config servers
mongod --configsvr --dbpath cfg0 --port 26050 --fork --logpath log.cfg0 --logappend # Con 1
mongod --configsvr --dbpath cfg1 --port 26051 --fork --logpath log.cfg1 --logappend # Con 2
mongod --configsvr --dbpath cfg2 --port 26052 --fork --logpath log.cfg2 --logappend # Con 3

# Test
mongod --configsvr --dbpath cfg0 --port 26050 --logappend # Con 1
mongod --configsvr --dbpath cfg1 --port 26051 --logappend # Con 2
mongod --configsvr --dbpath cfg2 --port 26052 --fork --logpath log.cfg2 --logappend # Con 3



# "Shards servers" (mongod data servers)
# note: Don't use smallfiles nor such a small oplogSize in production; 
mongod --shardsvr --replSet a --dbpath a0 --logpath log.a0 --port 27000 --fork --logappend --smallfiles --oplogSize 50 # Con 1
mongod --shardsvr --replSet a --dbpath a1 --logpath log.a1 --port 27001 --fork --logappend --smallfiles --oplogSize 50 # Con 2
mongod --shardsvr --replSet a --dbpath a2 --logpath log.a2 --port 27002 --fork --logappend --smallfiles --oplogSize 50 # Con 3

# "Shards servers" (mongod data servers)
# note: Don't use smallfiles nor such a small oplogSize in production; 
# To not run in background
#mongod --shardsvr --replSet a --dbpath a0 --port 27000 --logappend --smallfiles --oplogSize 50 # Con 1
#mongod --shardsvr --replSet a --dbpath a1 --port 27001 --logappend --smallfiles --oplogSize 50 # Con 2
#mongod --shardsvr --replSet a --dbpath a2 --port 27002 --logappend --smallfiles --oplogSize 50 # Con 3



#mongod --shardsvr --replSet b --dbpath b0 --logpath log.b0 --port 27100 --fork --logappend --smallfiles --oplogSize 50
#mongod --shardsvr --replSet b --dbpath b1 --logpath log.b1 --port 27101 --fork --logappend --smallfiles --oplogSize 50
#mongod --shardsvr --replSet b --dbpath b2 --logpath log.b2 --port 27102 --fork --logappend --smallfiles --oplogSize 50

#mongod --shardsvr --replSet c --dbpath c0 --logpath log.c0 --port 27200 --fork --logappend --smallfiles --oplogSize 50
#mongod --shardsvr --replSet c --dbpath c1 --logpath log.c1 --port 27201 --fork --logappend --smallfiles --oplogSize 50
#mongod --shardsvr --replSet c --dbpath c2 --logpath log.c2 --port 27202 --fork --logappend --smallfiles --oplogSize 50

#mongod --shardsvr --replSet d --dbpath d0 --logpath log.d0 --port 27300 --fork --logappend --smallfiles --oplogSize 50
#mongod --shardsvr --replSet d --dbpath d1 --logpath log.d1 --port 27301 --fork --logappend --smallfiles --oplogSize 50
#mongod --shardsvr --replSet d --dbpath d2 --logpath log.d2 --port 27302 --fork --logappend --smallfiles --oplogSize 50

# mongos processes # In production use the name of the server not localhost
mongos --configdb localhost:26050,localhost:26051,localhost:26052 --fork --logappend --logpath log.mongos0 # Con 1
mongos --configdb localhost:26050,localhost:26051,localhost:26052 --fork --logappend --logpath log.mongos1 --port 26061 # Con 2
mongos --configdb localhost:26050,localhost:26051,localhost:26052 --fork --logappend --logpath log.mongos2 --port 26062 # Con 3
#mongos --configdb localhost:26050,localhost:26051,localhost:26052 --fork --logappend --logpath log.mongos3 --port 26063 

# test mongos --configdb 172.17.0.2:26050,172.17.17.3:26051,172.17.0.4:26052 --fork --logappend --logpath log.mongos1 --port 26061

echo
#ps -A | grep mongo
ps -A | egrep mongo

echo
tail -n 1 log.cfg0
tail -n 1 log.cfg1
tail -n 1 log.cfg2

echo
tail -n 1 log.a0
tail -n 1 log.a1
tail -n 1 log.a2
tail -n 1 log.b0
tail -n 1 log.b1
tail -n 1 log.b2
tail -n 1 log.c0
tail -n 1 log.c1
tail -n 1 log.c2
tail -n 1 log.d0
tail -n 1 log.d1
tail -n 1 log.d2

echo 
tail -n 1 log.mongos0
tail -n 1 log.mongos1
tail -n 1 log.mongos2
tail -n 1 log.mongos3
