####
## Run this code on current directory of Dockerfile
## docker build -t imagename .
###
## Run this code after building using Dockerfile
## docker run --restart=always -it -P imagename --name tagname
###

# Step 1 - Base image
FROM ubuntu:14.04

# Step 2 - Replace shell with bash so we can source files
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Step 3 - Add Author
MAINTAINER Ronald San Diego

# Install application dependencies
RUN apt-get update && apt-get install -yq build-essential \
        libssl-dev \
        curl \
        git \
        nodejs \
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
RUN sudo apt-get remove node
RUN sudo apt-get install nodejs
RUN sudo ln -s /usr/bin/nodejs /usr/local/bin
RUN sudo npm install -g npm

# Remove npm locally
RUN npm uninstall npm -g
RUN rm -r ~/.nvm/versions/io.js/v3.0.0/lib/node_modules/npm

# Update to npm latest version
RUN npm install -g npm

# Add key from host to container 
#RUN mkdir -p /root/.ssh
#ADD id_rsa /root/.ssh/ 
#ADD id_rsa.pub /root/.ssh/
#ADD config /root/.ssh/

# Install sails & nodemon
RUN npm install -g sails nodemon --save

# Change Permission so no WARNING... happens 
#RUN start ssh \
#	&& chmod 600 /root/.ssh/id_rsa \
#	&& chmod 600 /root/.ssh/id_rsa.pub \
#	&& chmod 600 /root/.ssh/config \
#	&& chmod 755 /root/.ssh/

# Pull project from github to container
#RUN git clone https://github.com/RonaldSD/sails.git

# Change directory to main project folder & install dependecies of project
#RUN cd /sails/ && npm install && bower install --allow-root

RUN npm install -g forever --save

# Add this script in /usr/local/bin/ directory
ADD start-fn.sh /usr/local/bin/

# Change mode of the script so can be executable
# Using dos2unix to convert the script. That allow the container use sh script o
n its correct property
RUN chmod +x /usr/local/bin/start-fn.sh \
        && dos2unix /usr/local/bin/start-fn.sh

		
##
# Run forever with bash script
##		
# When creating a container execute this command at start up of the container.
#CMD bash -C '/usr/local/bin/start-fn.sh';'bash'


EXPOSE 1337:1337