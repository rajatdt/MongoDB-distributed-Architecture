#!/bin/bash

cd Script/
./CC2create-router.sh

echo "###############"
echo "Your in container router2"
echo "type ./shard-routerd2.sh"

docker exec -it router2 bash