#!/bin/bash
weave run 10.10.10.130/16 -it -p 23000:23000 --name router4 mongos --configdb 10.10.20.100:20000,10.10.20.110:20000,10.10.20.120:20000 --port 23000
