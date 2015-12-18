#!/bin/bash

cd Script/
apt-get install -y dos2unix
dos2unix /etc/init/weave.conf
cp weave.conf /etc/init/
start weave
./changemod.sh
./AA3install-weave.sh
./BB3create-container.sh
mkdir /execute/
cp EE3startNset-ip-cont.sh /execute/startNset-ip-cont.sh
cp EE3stop-container.sh /execute/stop-container.sh
cp start-cont.conf /etc/init/
dos2unix /etc/init/start-cont.conf
echo "###############"
echo "Your in container PRIMARY Rep3 Shard 3"
echo "type ./s3rep.sh"
docker exec -it s3rep3 bash