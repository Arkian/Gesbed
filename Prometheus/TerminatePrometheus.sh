 #!/bin/bash

#Exposing Prometheus as a Service 
kubectl delete -f prometheus-service.yaml

#delete a deployment and pod
kubectl delete -f prometheus-deployment.yaml 

#delete the config map in Kubernetes
kubectl delete -f config-map.yaml 

#delete the role using the following command
kubectl delete -f clusterRole.yaml

#delete the Namespace monitoring
#kubectl delete namespace monitoring








