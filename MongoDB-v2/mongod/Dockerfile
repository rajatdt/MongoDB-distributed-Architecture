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


# Add this script in /usr/local/bin/ directory
RUN mkdir -p /mymongo
ADD run.sh /mymongo/

# Change mode of the script so can be executable
# Using dos2unix to convert the script. That allow the container use sh script on its correct property 
RUN chmod +x /mymongo/run.sh \
	&& dos2unix /mymongo/run.sh


#EXPOSE 27017:27017 26050:26050 26051:26051 26052:26052 27000:27000 27001:27001 27002:27002 27100:27100 27101:27101 27102:27102 27200:27200 27201:27201 27202:27200 27300:27300 27301:27301 27302:27302 26061:26061 26062:26062 26063:26063 

EXPOSE 27017 27018 27019

# ENTRYPOINT ["usr/bin/mongod"]

