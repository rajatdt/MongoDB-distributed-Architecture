#!/bin/bash

cd Script/
apt-get install -y dos2unix
dos2unix /etc/init/weave.conf
cp weave.conf /etc/init/
start weave
./changemod.sh
./AA4install-weave.sh
./BB4create-container.sh
mkdir /execute/
cp EE4startNset-ip-cont.sh /execute/startNset-ip-cont.sh
cp EE4stop-container.sh /execute/stop-container.sh
cp start-cont.conf /etc/init/
dos2unix /etc/init/start-cont.conf
