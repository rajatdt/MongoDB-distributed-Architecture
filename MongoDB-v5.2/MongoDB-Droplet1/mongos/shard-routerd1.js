sh.addShard("S1repset/10.10.30.10:10000,10.10.40.10:10000,10.10.50.10:10000,10.10.60.10:10000")

sh.addShard("S2repset/10.10.40.20:10001,10.10.30.20:10001,10.10.50.20:10001,10.10.60.20:10001") 

sh.addShard("S3repset/10.10.50.30:10002,10.10.30.30:10002,10.10.40.30:10002,10.10.60.30:10002") 

sh.addShard("S4repset/10.10.60.40:10003,10.10.30.40:10003,10.10.40.40:10003,10.10.50.40:10003")

sh.enableSharding("couchjumping")
sh.shardCollection("couchjumping.person", {name: "hashed"}, false)
