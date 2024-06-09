# Steps to Create a Pod and Access the Static-Site

## Starting Minikube

If Minikube is not already running, start it using the following command: 
```bash
minikube start
```

## Creating a Secret for Docker Private Repository

Since the Docker repository is private, you need to create a secret to authenticate. Use the following command to create the secret:

```bash
kubectl create secret docker-registry testkube --docker-username=hsa404 --docker-password=<accesskey> --docker-email=agrawal.harsh@northeastern.edu --docker-server=https://index.docker.io/v1/
```

Replace `<your-docker-password-or-access-key>` with your actual Docker password or access key.

## Creating a Pod

To create a pod, apply the YAML file that contains the necessary specifications for the pod and its readiness probe. Run the following command:

```bash
kubectl apply -f <your-yaml-file-name>.yaml
```

Replace `<your-yaml-file-name>` with the actual name of your YAML file, such as `deployment.yaml`.

## Checking Pod Status

To check if the pod is ready and running, use the following commands:

```bash
kubectl get pod <pod-name>
kubectl describe pod <pod-name>
```

Replace `<pod-name>` with the actual name of your pod.

## Port-Forwarding

To access the static site, use port-forwarding. Run the following command:

```bash
kubectl port-forward pod/<pod-name> 9000:8080
```

Replace `<pod-name>` with the actual name of your pod.

commit for webhook5
