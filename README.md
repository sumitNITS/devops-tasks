## DevOps-Team-Tasks

This repository has two parts, one part has a small containerized application in it, also has the Kubernetes manifest for it. The second part has a terraform module to deploy a VPC + EKS cluster in a private subnet.

## Part 1

### Tiny App Development: 'SimpleTimeService'

- Created a simple microservice (which we will call "SimpleTimeService") in Python programming language exposed to port 5000
- The application is a web server that returns a pure JSON response with
  the following structure when its `/` URL path is accessed:

```json
{
  "ip": "<the IP address of the visitor>",
  "timestamp": "<current date and time>"
}
```
- Created a Dockerfile for this microservice
- The application is configured to run as a non-root user in the container
- Published the image to DockerHub so that it can be pulled by anyone for testing
- Created a Kubernetes manifest in YAML format, containing a Deployment and a Service, to deploy the microservice on Kubernetes
- The Deployment is using public Docker image from DockerHub
- I have used NodePort as a service for testing (If I don't mention it as NodePort it will serve as a ClusterIP service type, by default!)


To deploy the manifests to a running Kubernetes cluster and use the microservice, save the file "simpletimeservice.yml" into the current directory you are currently present and run the below command:

```sh
kubectl apply -f simpletimeservice.yml
```

