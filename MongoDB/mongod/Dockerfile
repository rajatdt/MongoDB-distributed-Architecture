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
MAINTAINER Ronald San Diego

# Add 10gen official apt source to the sources list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
RUN echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/10gen.list

# initctl fix
RUN dpkg-divert --local --rename --add /sbin/initctl
# Install application dependencies
RUN apt-get update && apt-get install -yq build-essential \
        libssl-dev \
        curl \
        git \
        vim \
        ca-certificates \
        python \
        rsync \
        software-properties-common \
        wget \
        dos2unix \
		mongodb-10gen \
        && apt-get clean
# Clean out apt-get - So we don't store extra space on the image.

# Create the MongoDB data directory
RUN mkdir -p /data/db
RUN mkdir /data/configdb

EXPOSE 27017
# ENTRYPOINT ["usr/bin/mongod"]

