#!/bin/bash
echo "Starting Config Server"
weave start 10.10.20.110/16 config2

echo "Starting Shards"
weave start 10.10.40.10/16 s1rep2
weave start 10.10.40.20/16 s2rep2
#weave start 10.10.40.30/16 s3rep2

echo "Starting arbiter"
weave start 10.10.40.40/16 s3arb

echo "Starting Router"
weave start 10.10.10.110/16 router2

