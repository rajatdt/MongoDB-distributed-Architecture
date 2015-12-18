If building new Docker image with MongoDB. \
Go to this directory on your command line and follow instruction below:

- cd /docker/MongoDB-Droplet4
- ./m-build.sh

After building docker images for MongoDB, create configserver and shards by:

- ./build-mongodb-d4.sh

PS: Before adding replica set, the other shards should be up on other droplet/server on digital ocean.
You are now inside s4rep4 primary container. Run script to add replica set for Shard4 and exit on this container:

- ./s4rep.sh
- exit 

There are two more config server need to run and remaining shards on other droplet/servers. If you finished setting up three config server and shards with replica set, you can set up the routers by running script:

- ./build-router.sh

Inside router4, execute:

- ./shard-routerd4.sh

PS: If any script not working probably there permission is not set up to be executable, to fix this:

- chmod +x namescript.sh

##### Getting in a container
- docker exec -it config4 bash
- docker exec -it router4 bash
- docker exec -it s1rep4 bash
- docker exec -it s2rep4 bash
- docker exec -it s3rep4 bash
- docker exec -it s4rep4 bash

##### Start a container
- weave start 10.10.20.130/16 config4
- weave start 10.10.60.10/16 s1rep4
- weave start 10.10.60.20/16 s2rep4
- weave start 10.10.60.30/16 s3rep4
- weave start 10.10.60.40/16 s4rep4
- weave start 10.10.10.130/16 router4
