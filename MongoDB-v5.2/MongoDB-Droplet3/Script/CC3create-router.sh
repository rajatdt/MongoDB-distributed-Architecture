#!/bin/bash
weave run 10.10.10.120/16 -it -p 23000:23000 --name router3 mongosv5-2 --configdb 10.10.20.100:20000,10.10.20.110:20000,10.10.20.120:20000 --port 23000
