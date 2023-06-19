() - > means parameter


- Docker  run (image_name)
	- -p -> (0000:0000) port binding first is host second is container
	- -d -> detach
	- --name -> change the name of the container**
	- -e -> Set an environnement variable
	- --net -> set a network for the container
	- -v (HOST_LOCATION):(CONTAINER_LOCATION) -> mounts HOST volume to Container for data persistence
	- -v (NAME):(CONTAINER_LOCATION) -> same as the first but as named volume, this one is more used in production
	Example -> $ docker run -d \
	-p6000:6739 \
	--name older_redis \
	-e MONGO_DB_USERNAME=user \
	--net my_custom_network \
	-v /home/data:/var/lib/data \
	-v custom_volume:/var/lib/data \
	redis:4.0

- Docker images -> show every images loaded

- Docker ps -> show a list of running containers
	- -a -> show history

- Docker pull -> get an image from a container hub

# In/out

- Docker start (container_name) -> Start a stopped container
- Docker stop (container_name) -> Stops a container

- Docker rm (container_name) -> removes a container (needs to be stopped)

# Debugging

- Docker Logs (container_name) -> Show the logs of a container for debugging

- Docker exec (container_name) (command (/bin/bash or /bin/sh)) -> execute a command on a container
	- -it -> interactive Terminal for accessing the containers terminal
	Example -> $ docker exec -it redis_older /bin/bash

# Network

- Docker network ls -> Shows a list of the docker networks
- Docker network create (network_name)-> Creates a network

# Docker Compose

- Docker compose -f (yml_file_name) up -> starts every container in the yml file
	- -d -> detach
- Docker compose -f (yml_file_name) down -> stops every container and networks in yml file

# IMAGES

- Docker build (docker_file_dir)
	- -t (image_name) -> sets the name for the custom image
- Docker rmi (docker_image_name) -> removes an image (containers using this image need to be deleted first)








mysql folder - var/lib/mysql
docker volume location - /var/lib/docker/volumes
