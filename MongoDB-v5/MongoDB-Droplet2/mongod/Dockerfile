####
## Run this code on current directory of Dockerfile
## docker build -t imagename .
###
## Enable container to run even after exit
## docker run --restart=always -it -P imagename --name tagname
###

# Step 1 - Base image
FROM ubuntu:14.04

# Step 2 - Replace shell with bash so we can source files
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Step 3 - Add Author
MAINTAINER Ronald San Diego & Yasvanth Babu

# Installation:
# Add 10gen official apt source to the sources list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
RUN echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/10gen.list


# Install application dependencies
RUN apt-get update && apt-get install -yq build-essential \
	curl \
    git \
    vim \
    wget \
    dos2unix \
	tmux \
	mongodb-10gen \
    && apt-get clean
# Clean out apt-get - So we don't store extra space on the image.


# Create the MongoDB data directory
RUN mkdir -p /data/db
RUN chown `id -u` /data/db
RUN mkdir /data/db/S1repset && mkdir /data/db/S2repset && mkdir /data/db/config1 && mkdir /data/db/config2 && mkdir /data/db/config3 
RUN mkdir /data/configdb

#### SCRIPT ####
ADD s2rep.sh /s2rep.sh
ADD s2rep.js /s2rep.js

RUN chmod a+x /s2rep.sh

# Expose port of container
EXPOSE 20000 10000 10001 10002 10003 

# Set usr/bin/mongod as the dockerized entry-point application
ENTRYPOINT ["usr/bin/mongod"]

#CMD ["usr/bin/mongod", "--replSet", "rs0"]
