## Docker Cheatsheet


### General

```bash
# Login to docker cloud
#
# Note: when using docker-machine, env vars need exporting
#       first, or it will error about non-interactive shells
docker login

# Connect through [or send command over] SSH
docker-machine ssh <vmname> [command]

# Export machine config to shell
eval $(docker-machine env <vmname>)
```


### Containers

```bash
# List containers (including inactive)
docker container ls -a

# Stop a container
docker container [stop|kill] <hash>

# Remove containers
docker container rm <hash>
docker container rm $(docker container ls -aq)
```

### Images

```bash
# Create image from Dockerfile
docker build -t <image[:tag]> .

# Run image (add -d to run detached)
docker run [-p <host_port>:<container_port>] <[user/]image>

# List all images
docker image ls -a

# Remove an image
docker image rm <image id>

# Remove ALL images
docker image rm $(docker image ls -aq)

# Publish to Docker Cloud
docker tag <image> <username>/<repo>[:tag]
docker push <username>/<repo>[:tag]
```


### Stacks and VMs

```bash
# Create a vm
docker-machine create --driver virtualbox <vmname>

# Create stack from docker-compose.yml
# Add --with-registry-auth for private repositories
docker stack deploy -c <yamlfile> <appname>

# Update stack after changes
docker stack deploy

# List stacks/services
docker stack ls
docker service ls

# List services associated with a stack
docker stack ps <image>
docker service ps <image>_<service>

# Get a metric fuckton of JSON about something
# Accepts a hash or name of a container/service
docker inspect <task/container>

# Leave a swarm
docker swarm leave

# Start a non-running vm
docker-machine start <vmname>

# Copying files to vm
# Syntax same as *nix SCP. <dest> uses vm name as host part
# Not sure if 100% compatible - can <src> be <server:file> too?
docker-machine scp <src> <dest>

# Stop/remove VMs
docker-machine [stop|rm] [vmname|$(docker-machine ls -q)]
```
