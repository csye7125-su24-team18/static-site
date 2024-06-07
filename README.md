Steps to Create a Pod and Access the Static-Site
This guide provides detailed steps to start Minikube, create a Kubernetes secret for accessing a private Docker repository, create a pod, and access the static site.

Starting Minikube
If Minikube is not already running, start it using the following command: minikube start
Creating a Secret for Docker Private Repository
Since the Docker repository is private, you need to create a secret to authenticate. Use the following command to create the secret:


kubectl create secret docker-registry kubesecret `
  --docker-username=hsa404 `
  --docker-password=<your-docker-password-or-access-key> `
  --docker-email=agrawal.harsh@northeastern.edu `
  --docker-server=https://index.docker.io/v1/
Replace <your-docker-password-or-access-key> with your actual Docker password or access key.

Creating a Pod
To create a pod, apply the YAML file that contains the necessary specifications for the pod and its readiness probe. Run the following command:


kubectl apply -f <your-yaml-file-name>.yaml
Replace <your-yaml-file-name> with the actual name of your YAML file, such as deployment.yaml.

Checking Pod Status
To check if the pod is ready and running, use the following commands:


kubectl get pod <pod-name>
kubectl describe pod <pod-name>
Replace <pod-name> with the actual name of your pod.

Port-Forwarding
To access the static site, use port-forwarding. Run the following command:


kubectl port-forward pod/<pod-name> 8080:9000
