Steps to create a POD and access the static-site
To start kube
start minikube (if already started, ignore it)
As docker is the private repo, create a secret using below command :
 kubectl create secret docker-registry kubesecret `        
>>   --docker-username=hsa404 `
>>   --docker-password=password or docker access key `
>>   --docker-email=agrawal.harsh@northeastern.edu `
>>   --docker-server=https://index.docker.io/v1/
to create a POD
kubectl apply -f enter the yaml file name (ex. deployment.yaml that has all spec to create pod and probe)
To check if POD is ready and running 
kubectl get pod podname
kubectl describe pod podname
To port-forward , run 
kubectl port-forward pod/podname 8080:9000