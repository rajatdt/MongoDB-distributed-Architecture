#!/bin/bash

cd Script/
./CC3create-router.sh

echo "###############"
echo "Your in container router3"
echo "type ./shard-routerd3.sh"
docker exec -it router3 bash