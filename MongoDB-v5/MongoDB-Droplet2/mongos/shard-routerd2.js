sh.addShard("S1repset/10.10.30.10:10000")

sh.addShard("S2repset/10.10.40.20:10001") 

sh.enableSharding("couchjumping")
sh.shardCollection("couchjumping.person", {name: "hashed"}, false)
