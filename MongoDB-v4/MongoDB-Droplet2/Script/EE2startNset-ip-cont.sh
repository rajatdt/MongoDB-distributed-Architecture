#!/bin/bash
echo "Starting Config Server"
weave start 10.10.20.110/16 config2

echo "Starting Shards"
weave start 10.10.40.10/16 ss1
weave start 10.10.40.20/16 ps2
weave start 10.10.40.30/16 ss3

echo "Starting Router"
weave start 10.10.10.110/16 router2

