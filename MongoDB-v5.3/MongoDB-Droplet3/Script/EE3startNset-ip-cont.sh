#!/bin/bash
weave start 10.10.20.120/16 config3

echo "Starting Shards"
weave start 10.10.50.10/16 s1rep3
weave start 10.10.50.20/16 s2rep3
weave start 10.10.50.30/16 s3rep3

echo "Starting Router"
weave start 10.10.10.120/16 router3

