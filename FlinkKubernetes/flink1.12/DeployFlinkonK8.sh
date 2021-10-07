 #!/bin/bash

#Common cluster components
kubectl create -f flink-configuration-configmap.yaml
kubectl create -f jobmanager-service.yaml

#To deploy a Session Cluster
kubectl create -f jobmanager-deployment.yaml
kubectl create -f taskmanager-deployment.yaml

#To deploy a Job Cluster
#kubectl create -f jobmanager-job.yaml
#kubectl create -f taskmanager-job-deployment.yaml

#To create the NodePort service on jobmanager
kubectl create -f jobmanager-rest-service.yaml

#To proxy to Jobmanager webui and see Flink dashboard in browser
#kubectl proxy
