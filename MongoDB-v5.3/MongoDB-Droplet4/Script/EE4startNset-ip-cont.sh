#!/bin/bash
echo "Starting Shards"
#weave start 10.10.60.10/16 s1rep4
weave start 10.10.60.20/16 s2rep4
weave start 10.10.60.30/16 s3rep4

echo "Starting arbiter"
weave start 10.10.60.40/16 s4arb

echo "Starting Router"
weave start 10.10.10.120/16 router3

