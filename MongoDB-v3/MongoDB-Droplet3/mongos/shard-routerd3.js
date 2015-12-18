sh.addShard("S3repset/10.10.30.10:10000");

sh.addShard("S3repset/10.10.40.20:10001") 

sh.addShard("S3repset/10.10.50.30:10002") 

sh.addShard("S3repset/10.10.60.40:10003")

sh.enableSharding("couchjumping")
sh.shardCollection("couchjumping.person", {name: "hashed"}, false)
