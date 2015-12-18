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
		#nodejs \ 
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
        && apt-get clean
# Clean out apt-get - So we don't store extra space on the image.

# Compatibility fix for node on ubuntu
RUN ln -s /usr/bin/nodejs /usr/bin/node;

# Install nvm
RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.24.0/install.sh | sh;

# Invoke nvm to install node
RUN cp -f ~/.nvm/nvm.sh ~/.nvm/nvm-tmp.sh; \
	echo "nvm install iojs-v3.0.0; nvm alias default iojs-v3.0.0" >> ~/.nvm/nvm-tmp.sh; \
    sh ~/.nvm/nvm-tmp.sh; \
    rm ~/.nvm/nvm-tmp.sh;

# Add nodejs and and fix symlink and to install sails
#RUN sudo apt-get remove node
#RUN sudo apt-get install nodejs
#RUN sudo ln -s /usr/bin/nodejs /usr/local/bin
RUN sudo npm install -g npm

# Remove npm locally
RUN npm uninstall npm -g
RUN rm -r ~/.nvm/versions/io.js/v3.0.0/lib/node_modules/npm

###
# SOMETHING MISSING FOR NPM
###

# Update to npm latest version
#WORKDIR /grandsocial
#COPY /grandsocial/package.json /grandsocial/package.json

#RUN chown -R `whoami` ~/.nvm

ENV PATH /root/.nvm/versions/io.js/v3.0.0/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/lib/node_modules/

#RUN export PATH="/root/.nvm/versions/io.js/v3.0.0/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/lib/node_modules/"

RUN npm install -g npm

#RUN /root/.nvm/versions/io.js/v3.0.0/bin/npm install
#COPY /grandsocial/ /grandsocial/


# Install sails & nodemon
#RUN npm install -g sails --unsafe-perm bower nodemon --save

#ADD grandsocial/ /grandsocial

#RUN mkdir /grandsocial
#ADD package.json /grandsocial/package.json
#RUN cd /grandsocial && sudo npm install


EXPOSE 1337
EXPOSE 27017




