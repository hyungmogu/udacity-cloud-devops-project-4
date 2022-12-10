#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
# dockerpath=<your docker ID/path>
tag="microservice-server"
dockerpath="guhyungm7/udacity-cloud-devops-microservice"

# Step 2:  
# Authenticate & tag
# docker login --username=<USER_NAME>
echo "Docker ID and Image: $dockerpath"
docker tag "$tag" "$dockerpath:$tag"


# Step 3:
# Push image to a docker repository
docker login
docker push "$dockerpath:$tag"