#!/bin/bash

cd mongod
chmod +x mongod-image.sh
./mongod-image.sh
cd ../mongos
chmod +x mongos-image.sh
./mongos-image.sh
