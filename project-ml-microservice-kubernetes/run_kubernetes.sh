#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
tag="microservice-server"
dockerpath="guhyungm7/udacity-cloud-devops-microservice"

# Step 2
# Run the Docker Hub container with kubernetes
kubectl create deploy "$tag" --image="$dockerpath:$tag"

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
POD=$(kubectl get pods -l app="$tag" -o name --no-headers=true)
kubectl port-forward "$POD" --address 0.0.0.0 8000:80
