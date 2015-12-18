#!/bin/bash
weave start 10.10.20.130/16 config4

echo "Starting Shards"
weave start 10.10.60.10/16 s1rep4
weave start 10.10.60.20/16 s2rep4
weave start 10.10.60.30/16 s3rep4
weave start 10.10.60.40/16 s4rep4

echo "Starting Router"
weave start 10.10.10.130/16 router4

