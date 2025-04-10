
## Project Structure

This repo lives in Documents/assessment-task/ on the local machine and has two parts:
* app-on-docker/ – Contains the Node.js app and Docker build scripts.
* kubernetes-task/ – Contains all Kubernetes YAMLs and a script to generate them.

## Exercise 1: Node.js App in a Docker Container

##App Code
File: app-on-docker/app.js
A simple express server that listens on port 3000 and returns a success message.

##Other Files
* package.json – Declares express and points to app.js.
* Dockerfile – Builds the app image using node:alpine, installs packages, copies files, and exposes port 3000.

##Scripts
Each script creates one of the required files:
* create-app-js.sh – Generates app.js.
* create-package-json.sh – Generates package.json.
* create-dockerfile.sh – Creates the Dockerfile.

##Docker Image

The image is pushed to Docker Hub under this path:

docker.io/akashpndya/my-node-app:latest

This is used in the Kubernetes deployment. Please note, there no 'a' in my last name and above path is correct.

————————————————————————————————————

## Exercise 2: Kubernetes App with Network Restrictions

##Manifest Folder
All YAML files for Kubernetes are inside:
kubernetes-task/manifests/ (local machine)

##Resources Breakdown

1. Deployment: my-app-deployment.yaml
This deployment runs the app using the Docker image from Docker Hub(the one listed above). The container listens on port 3000 (no internal remapping). Pods are labeled app=my-app.

2. Service: my-app-service.yaml
A ClusterIP service exposes port 3000 and routes it to the pod on the same port. Selects pods with app=my-app.

3. NetworkPolicy: my-app-network-policy.yaml
This policy limits incoming traffic to only pods labeled app=trusted. No ports are specified, so all ports are restricted unless accessed from trusted pods.

4. Trusted Pod: trusted-pod.yaml
A pod running the curlimages/curl image to test access to the app. This pod has the app=trusted label and is used to validate that the policy allows it to connect.

5. Cache Deployment: cache-deployment.yaml
This is a Redis deployment labeled app=cache. It doesn't interact with the app and is there as an example of a separate workload.

##Automation Script
File: create-kubernetes-manifests.sh.
This script auto-generates all the Kubernetes manifest files, making it easier to recreate everything later.

##Test Steps
1. Build and Push Docker Image
    * Build locally and push to Docker Hub.
2. Deploy to Kubernetes
    * Apply all manifests using kubectl apply -f manifests/.
3. Connectivity Test
    * Exec into the trusted pod using the command --> kubectl exec -it trusted-pod -- sh, then run --> wget http://my-app-service:3000
4. Check Logs
    * Use kubectl logs -l app=my-app to confirm the app is running and receiving traffic.

##Notes and Fixes
* Initially, the app was bound to localhost only. Changing it to 0.0.0.0 fixed access issues inside the container.
* The service now correctly forwards traffic from port 3000 to port 3000 in the container (earlier there was a mismatch to port 80).
* Scripts have been tested and create all files consistently.
