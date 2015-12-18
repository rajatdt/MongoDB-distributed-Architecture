# Docker with Dockerfile #
## Introduction ##

[Docker](https://www.docker.com/whatisdocker "Docker") is an open source container based technology. This means it allows the developer to package up an application of all its parts, which package it all up in a container. This is an isolated environment that the application has all that it needs to run inside of a container that is the operating system.

The reason of using Docker is to help developers and system admins to have the same dependencies so when deploying their application they can use it running across systems and machines, also to have no conflict between to groups.
Docker achieves this by creating safe, LXC (i.e. Linux Containers) based environments for applications called “docker containers”.

These containers are created using docker images, which can be built either by executing commands manually or automatically through Dockerfiles.
Each Dockerfile is a script, composed of various commands and arguments listed successively to automatically perform actions on a base image in order to create a new one.

On this repository the main goal is to have a fully working iojs, sails.js, nodemon and forever with the base image Ubuntu 14.04. The idea is to have iojs run as web server which the sails.js to be the framework of the web. While sails.js and iojs running, nodemon monitor the for any changes in the project it will reset the server.The forever then ensure that if server crashes forever restart the server so in short with nodemon and forever the web server will run 24/7.


## Run Environment ##
    - Docker version 1.7.1, build 786b29d
    - Boot2Docker-cli version: v1.7.1
    - Windows 8.1
    - VirtualBox Graphical User Interface Version 4.3.30 r101610
    
## Installation ##
The core components of Docker to run in your machine consists of:
    
    - Docker Daemon (Docker Engine) that is running on the host machine.
    - Docker client which is the Command Line Interface (CLI) used to interact with the daemon.

![docker_components.png](https://bitbucket.org/repo/jBKaj4/images/616028209-docker_components.png)

### Linux machine ###
To install Docker in Linux machine all we need is simple script provided by Docker but we need curl to run the script: (Type the command below in your command prompt)

    apt-get -y install curl
    curl -sSL https://get.docker.com/ | sudo sh
    docker run hello-world 
    
### Windows/Mac machine ###
Installing Docker in Windows/Mac it needs boot2docker that is a virtual box to spin up virtual environment of Linux on top of non linux machine.

- Go to [boot2docker](http://boot2docker.io/ "boot2docker") and choose operating system (OS) you are running
- After clicking the OS you are running, click the [docker-install.exe](https://github.com/boot2docker/windows-installer/releases "docker windows") to download the installation and follow the instruction.
- The [docker-install.exe](https://github.com/boot2docker/windows-installer/releases "docker windows") allows you to install any program you are missing to enable boot2docker to run smoothly. Install any program you are missing.
- After following instuction provided in [docker-install.exe](https://github.com/boot2docker/windows-installer/releases "docker windows") a shortcut called **Boot2Docker Start** should pop out in your Desktop
- After opening **Boot2Docker Start** type in: *docker run hello-world* to know you installed docker successful.


## Basic Command used in Docker ##
![docker_workflow_components.png](https://bitbucket.org/repo/jBKaj4/images/2590001045-docker_workflow_components.png)

### Containers ###
The common code used for containers

#### LifeCycle of containers in Docker ####
- [docker create](https://docs.docker.com/reference/commandline/create "Create container") creates a container but does not start it.
- [docker run](https://docs.docker.com/reference/commandline/run "Run container") run creates and starts a container in one operation.
- [docker stop](https://docs.docker.com/reference/commandline/stop "Stop container") stops it.
- [docker start](https://docs.docker.com/reference/commandline/start "Start Container") will start it again. 
- [docker restart](https://docs.docker.com/reference/commandline/restart "Restarts Container") restarts a container. 
- [docker rm](https://docs.docker.com/reference/commandline/rm "Delete a container") deletes a container. You cannot delete a running container. 
- [docker attach](https://docs.docker.com/reference/commandline/attach "Attach container") will connect to a running container. 

#### Info ####
More details in a container. 

- [docker ps](https://docs.docker.com/reference/commandline/ps "Running container") shows running containers. 
- [docker logs](https://docs.docker.com/reference/commandline/logs "Logs of container") gets logs from container. 
- [docker inspect](https://docs.docker.com/reference/commandline/inspect "Inspect container") looks at all the info on a container (including IP address). 
- [docker port](https://docs.docker.com/reference/commandline/port "Port of containers") shows public facing port of container.
- [docker top](https://docs.docker.com/reference/commandline/top "Running processes") shows running processes in container. 
- [docker stats](https://docs.docker.com/reference/commandline/stats "Resource usage") shows containers' resource usage statistics.
- **docker ps -a** shows running and stopped containers.

### Images ###
The common code used for images.

#### LifeCycle of images in Docker ####
- [docker images](https://docs.docker.com/reference/commandline/images "Shows images") shows all images.
- [docker import](https://docs.docker.com/reference/commandline/import "tarball image") creates an image from a tarball. 
- [docker build](https://docs.docker.com/reference/commandline/build "Create image from Dockerfile") creates image from Dockerfile. 
- [docker commit](https://docs.docker.com/reference/commandline/commit "Create image from contaier") creates image from a container. 
- [docker rmi](https://docs.docker.com/reference/commandline/rmi "Remove Image") removes an image.

#### Info ####
More information in images.

- [docker history](https://docs.docker.com/reference/commandline/history "History of Image") shows history of image.
- [docker tag](https://docs.docker.com/reference/commandline/tag "Tag an Image") tags an image to a name (local or registry). 

Docker image ids are [sensitive information](https://medium.com/@quayio/your-docker-image-ids-are-secrets-and-its-time-you-treated-them-that-way-f55e9f14c1a4 "Keep image private") and should not be exposed to the outside world. Treat them like passwords.

### Brief Walkthrough of Dockerfile ###
The goal of Dockerfile is to build a container that has all configuration of user's needed before having a running container.

Instruction of Dockerfile

* [FROM](https://docs.docker.com/reference/builder/#from) - Set the base Image.
* [MAINTAINER](https://docs.docker.com/reference/builder/#maintainer) - Defining the author.
* [RUN](https://docs.docker.com/reference/builder/#run) - takes a command as its argument and runs it to form the image.
* [CMD](https://docs.docker.com/reference/builder/#cmd) - Executing a specific command.
* [EXPOSE](https://docs.docker.com/reference/builder/#expose) - Opening port of container to the outside world.
* [ENV](https://docs.docker.com/reference/builder/#env) - used to set the environment variables.
* [ADD](https://docs.docker.com/reference/builder/#add) - Copy files from host to containers. 
* [ENTRYPOINT](https://docs.docker.com/reference/builder/#entrypoint) - argument sets the concrete default application that is used every time a container is created using the image. 
* [VOLUME](https://docs.docker.com/reference/builder/#volume) - to enable access from your container to a directory on the host machine. 
* [USER](https://docs.docker.com/reference/builder/#user) - Directive to set username. 
* [WORKDIR](https://docs.docker.com/reference/builder/#workdir) - used to set where the command defined with CMD is to be executed.

On this section, I will have a brief walkthough of Dockerfile of this repository.

* Step 1 || The base image of this Dockerfile will be Ubuntu 14.04.

* Step 2 || Replace shell with bash so we can source files

* Step 3 || Add Author
    
* Step 4 || Run command to update the image and install application needed.

* Step 5 || Set the environment variables for setting up node PATHS
    
* Step 6 || Install nvm (Node Version Manager) using curl then install other application that only nvm can install such as iojs. Make iojs as default so when container start running the iojs can be executed automatically.
    
* Step 7 || Use npm (Node Package Manager) install sails, nodemon and forever.
    
* Step 8 || Add node path to PATH so we can run it globally.
    
* Step 9 || As pulling repository to github/bitbucket to our container, I have set my
public host key on the github to be part of deploy key so I am the only can pull and push the repository. To do that I added directory called .ssh and public keys to this container so my github repository can identify that the container is me. I have add a config file and inside this file, it will ignore host key checking.
    
* Step 10 || After adding the keys and config file. I changed ownership to 600, so the owner can read and write and directory file to 755.
    
* Step 11 || As the sails project is pulled from GitHub we need to install the node_modules so the project will run normally. 
    
* Step 12 || Open port 1337 for sails to use
    
* Step 13 || Add script, which will execute forever and will run nodemon, nodemon then monitor the sails.js.
    
* Step 14 || Change ownership of this script so it can be executable. The sh file is from windows so we will use dos2unix to convert it so the container ubuntu base can run normally. 
    
* Step 15 || Add symlink to nodejs. 
    
* Step 16 || Add a CMD command to Dockerfile so when running a new container this command will execute as soon as the container start.
    

To build Dockerfile you need to be on the same directory of where the Dockerfile your building. Example: My Dockerfile is on Desktop and I should run the build command of docker within my Desktop. 

                        docker build -t imagename .
                        
To enable for us to disable the container to turn off when exiting we need to add *--restart=always* so the forever application wont turn off.

            docker run --restart=always -it -P imagename --name tagname


### Further Work ###
When running this on my localhost the idea mentioned in introduction is working normally. 

Things for further work:

* To put this repository within digital ocean so we can test if it will run the same like on my localhost.

* The Dockerfile configuration will be changed depending on application needed and what version will be used.

* Have other option to make sure if container reboot the forever should run the web server automatically. Example: Find other option to replace --restart=always with different method.

### Tutorial / Example ###
Good tutorial of how to improve using Dockerfile.

* [Flux7's Dockerfile Tutorial](http://flux7.com/blogs/docker/docker-tutorial-series-part-3-automation-is-the-word-using-dockerfile/ "Tutorial")

* [Best practices for writing Dockerfiles](https://docs.docker.com/articles/dockerfile_best-practices/ "Best Practices")

* [Dockerfiles best practices Part 2](http://crosbymichael.com/dockerfile-best-practices.html "Best Practices Part 2")