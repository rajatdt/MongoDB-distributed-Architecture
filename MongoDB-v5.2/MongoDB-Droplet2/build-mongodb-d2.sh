#!/bin/bash

cd Script/
apt-get install -y dos2unix
dos2unix /etc/init/weave.conf
cp weave.conf /etc/init/
start weave
./changemod.sh
./AA2install-weave.sh
./BB2create-container.sh
mkdir /execute/
cp EE2startNset-ip-cont.sh /execute/startNset-ip-cont.sh
cp EE2stop-container.sh /execute/stop-container.sh
cp start-cont.conf /etc/init/
dos2unix /etc/init/start-cont.conf
echo "###############"
echo "Your in container PRIMARY Rep2 Shard 2"
echo "type ./s2rep2.sh"
docker exec -it s2rep2 bash