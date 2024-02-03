## DevOps-Team-Tasks

This repository has two parts, The First part has a small containerized application in it, also has the Kubernetes manifest for it. The second part has a terraform module to deploy a VPC + EKS cluster in a private subnet.

## Part 1

### Tiny App Development: 'SimpleTimeService'

- Created a simple microservice (which we will call "SimpleTimeService") in Python programming language exposed to port 5000
- The application is a web server that returns a pure JSON response with
  the following structure when its `/` URL path is accessed:

```json
{
  "ip": "<the IP address of the visitor>",
  "timestamp": "<current date and time in UTC>"
}
```
- Created a Dockerfile for this microservice.
- The application is configured to run as a non-root user in the container.
- Published the image to DockerHub so that it can be pulled by anyone for testing.
- Created a Kubernetes manifest in YAML format, containing a Deployment and a Service, to deploy the microservice on Kubernetes.
- The Deployment is using public Docker image from DockerHub.
- I have used NodePort as a service for testing (If I don't mention it as NodePort it will serve as a ClusterIP service type, by default!)


To deploy the manifests to a running Kubernetes cluster and use the microservice, save the file "simpletimeservice.yml" (It is inside the app folder of this repository) into your current working directory and run the below command:

```sh
kubectl apply -f simpletimeservice.yml
```
You can access the application by running the command below:

```sh
curl <NodeIPAddress:NodePort>
```

## Part 2

Using Terraform, I have created the following infrastructure in AWS:

- A VPC with 2 public and 2 private subnets.
- An EKS cluster deployed to that VPC.
- The cluster with 2 nodes, using instance type `m6a.large`.
- The nodes are residing in private subnets.

To work with these terraform files, you need to have AWS CLI installed on your machine and you need to get the CLI Access Keys from your AWS account User. Then you have to configure AWS from your terminal using the command "aws configure" and after providing the access keys, secret keys, region name, and output format you are ready to work with AWS using these terraform templates present inside the terraform folder.

To work with these terraform templates save the terraform folder in your machine, cd into it and run the commands below:

```sh
terraform init
```

```sh
terraform plan
```

```sh
terraform apply
```

After some time the infrastructure will get deployed into your AWS environment. You can verify them by going inside your AWS account.

## Additional Actions

- Updated additional lines in Kubernetes manifest to utilize best practices e.g. pod CPU and memory limits. (Kept as a Comment in the manifest)
- Added a sidecar container (fluentbit) in the Kubernetes manifest to collect and forward logs from the main application container. (Kept as a Comment in the manifest)
- Created a simple CI/CD pipeline using GitHub Actions to publish the container image with the build number as a tag to the container registry, and commit the configuration to our solution repository. (Pipeline definition file is inside .github/workflows/cicd.yml)

Thank you so much for reading up to this point.
