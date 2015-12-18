#!/bin/bash
weave start 10.10.20.120/16 config3

echo "Starting Shards"
weave start 10.10.50.10/16 ss1
weave start 10.10.50.20/16 ss2
weave start 10.10.50.30/16 ps3

echo "Starting Router"
weave start 10.10.10.120/16 router3

