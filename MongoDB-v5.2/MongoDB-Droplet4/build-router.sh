#!/bin/bash

cd Script/
./CC4create-router.sh

echo "###############"
echo "Your in container router4"
echo "type ./shard-routerd4.sh"

docker exec -it router4 bash