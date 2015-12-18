#!/bin/bash

cd Script/
apt-get install -y dos2unix
dos2unix /etc/init/weave.conf
cp weave.conf /etc/init/
start weave
./changemod.sh
./AA1install-weave.sh
./BB1create-container.sh
mkdir /execute/
cp EE1startNset-ip-cont.sh /execute/startNset-ip-cont.sh
cp EE1stop-container.sh /execute/stop-container.sh
cp start-cont.conf /etc/init/
dos2unix /etc/init/start-cont.conf
echo "###############"
echo "Your in container PRIMARY Rep1 Shard 1"
echo "type ./s1rep.sh"
docker exec -it ps1 bash