####
## Run this code on current directory of Dockerfile
## docker build -t imagename .
###
## Run this code after building using Dockerfile
## docker run --restart=always -it -P imagename --name tagname

# Base image stable Ubuntu 14.04
FROM ubuntu:14.04

# Replace shell with bash so we can source files
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Add Author
MAINTAINER Ronald San Diego

# Install application dependencies
RUN apt-get update && apt-get install -yq build-essential \
        libssl-dev \
        curl \
        git \
	npm \
        vim \
        ca-certificates \
        python \
        rsync \
        software-properties-common \
        wget \
        dos2unix \
        zlib1g-dev \
        gcc \
	make \
	g++ \
	python-software-properties \
        && apt-get clean
# Clean out apt-get - So we don't store extra space on the image.

# Install NodeJs
RUN curl --silent --location https://deb.nodesource.com/setup_0.12 | sudo bash -
RUN sudo apt-get install --yes nodejs

# Install npm
RUN sudo npm install npm -g 

# Install iojs 
#RUN curl -sL https://deb.nodesource.com/setup_iojs_3.x | sudo -E bash -
#RUN sudo apt-get install -y iojs

# Install node v4.0.0 
RUN npm cache clean -f
RUN npm install -g n
RUN n stable

# Fixing npm permission - to run globally
RUN mkdir ~/npm-global
RUN npm config set prefix '~/npm-global'
#RUN export PATH=~/npm-global/bin:$PATH

ENV PATH 	~/npm-global/bin:$PATH

RUN npm install -g sails --unsafe-perm nodemon --save

##
# Install MongoDB
##
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
RUN echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/mongodb.list
RUN apt-get update
RUN apt-get install mongodb-10gen

# Make Directory for MongoDB to use
RUN mkdir -p /data/db
RUN mkdir -p /var/mongodb

##
# Install Graphics Magick
##
#RUN add-apt-repository -y ppa:dhor/myway
#RUN apt-get update
#RUN apt-get install -y graphicsmagick

EXPOSE 1337 27017 80

#WORKDIR /cj-localhost/
##
##
# Add script to run project
# Change mode of the script so can be executable
# Using dos2unix to convert the script. That allow the container use sh script on its correct property 
RUN chmod +x /usr/local/bin/start-project.sh \
	&& dos2unix /usr/local/bin/start-project.sh
	
#CMD bash -C '/usr/local/bin/start-project.sh';'bash'
#RUN chmod +x /cj-localhost/start-project.sh \
#	&& dos2unix /cj-localhost/start-project.sh

#CMD bash -C '/cj-localhost/start-project.sh';'bash'
ADD beta.couchjumping /beta-cj
