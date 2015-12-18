If building new Docker image with MongoDB. \
Go to this directory on your command line and follow instruction below:

- cd /docker/MongoDB-Droplet1
- ./m-build.sh

After building docker images for MongoDB, create configserver and shards by:

- ./build-mongodb-d1.sh

PS: Before adding replica set, the other shards should be up on other droplet/server on digital ocean.
You are now inside s1rep1 container. Run script to add replica set for Shard1 and exit on this container:

- ./s1rep.sh
- exit 

There are two more config server need to run and remaining shards on other droplet/servers. If you finished setting up three config server and shards with replica set, you can set up the routers by running script:

- ./build-router.sh

Inside router1, execute:

- ./shard-routerd1.sh

PS: If any script not working probably there permission is not set up to be executable, to fix this:

- chmod +x namescript.sh

##### Getting in a container
- docker exec -it config1 bash
- docker exec -it router1 bash
- docker exec -it s1rep1 bash
- docker exec -it s2rep1 bash
- docker exec -it s3rep1 bash
- docker exec -it s4rep1 bash

##### Start a container
- weave start 10.10.20.110/16 config1
- weave start 10.10.40.10/16 s1rep1
- weave start 10.10.40.20/16 s2rep1
- weave start 10.10.40.30/16 s3rep1
- weave start 10.10.40.40/16 s4rep1
- weave start 10.10.10.110/16 router2



