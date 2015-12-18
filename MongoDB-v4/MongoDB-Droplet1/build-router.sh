#!/bin/bash

cd Script/
./CC1create-router.sh
echo "###############"
echo "Your in container router1"
echo "type ./shard-routerd1.sh"
docker exec -it router1 bash