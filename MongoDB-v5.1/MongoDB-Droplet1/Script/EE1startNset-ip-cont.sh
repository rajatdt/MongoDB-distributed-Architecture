#!/bin/bash
echo "Starting Config Server"
weave start 10.10.20.100/16 config1

echo "Starting Shards"
weave start 10.10.30.10/16 s1rep1
weave start 10.10.30.20/16 s2rep1

echo "Starting Router"
weave start 10.10.10.100/16 router1

