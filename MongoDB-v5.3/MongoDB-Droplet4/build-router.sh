#!/bin/bash

cd Script/
./CC4create-router.sh

echo "###############"
echo "Your in container router3"
echo "type ./shard-routerd3.sh"
docker exec -it router4 bash