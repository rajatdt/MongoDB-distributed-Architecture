//sh.addShard("shard1/10.10.30.10:10000,shard2/10.10.40.10:10000,shard3/10.10.30.30:10000")

//sh.addShard("shard2/10.10.40.10:10000,shard10.10.40.20:10001,10.10.40.30:10002") 

//sh.addShard("S3repset/10.10.50.10:10000,10.10.50.20:10001,10.10.50.30:10002") 

//sh.enableSharding("couchjumping")
//sh.shardCollection("couchjumping.person", {name: "hashed"}, false)

/*
•	PRIMARY 	S1 Rep1 - 10.10.30.10 Port 10000  
•	SECONDARY	S1 Rep2- 10.10.40.10 Port 10000
•	SECONDARY  	S1 Rep3 - 10.10.50.20 Port 10000 

•	PRIMARY	S2 Rep2- 10.10.40.10 Port 10000
•	SECONDARY 	S2 Rep1 - 10.10.30.20 Port 10001
•	SECONDARY 	S2 Rep3 - 10.10.50.30 Port 10002

