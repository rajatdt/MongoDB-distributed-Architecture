If building new Docker image with MongoDB. \
Go to this directory on your command line and follow instruction below:

- cd /docker/MongoDB-Droplet3
- ./m-build.sh

After building docker images for MongoDB, create configserver and shards by:

- ./build-mongodb-d3.sh

PS: Before adding replica set, the other shards should be up on other droplet/server on digital ocean.
You are now inside s3rep3 container. Run script to add replica set for Shard1 and exit on this container:

- ./s3rep.sh
- exit 

There are two more config server need to run and remaining shards on other droplet/servers. If you finished setting up three config server and shards with replica set, you can set up the routers by running script:

- ./build-router.sh

Inside router3, execute:

- ./shard-routerd3.sh

PS: If any script not working probably there permission is not set up to be executable, to fix this:

- chmod +x namescript.sh

##### Getting in a container
- docker exec -it config3 bash
- docker exec -it router3 bash
- docker exec -it s1rep3 bash
- docker exec -it s2rep3 bash
- docker exec -it s3rep3 bash
- docker exec -it s4rep3 bash

##### Start a container
- weave start 10.10.20.120/16 config3
- weave start 10.10.50.10/16 s1rep3
- weave start 10.10.50.20/16 s2rep3
- weave start 10.10.50.30/16 s3rep3
- weave start 10.10.50.40/16 s4rep3
- weave start 10.10.10.120/16 router3



