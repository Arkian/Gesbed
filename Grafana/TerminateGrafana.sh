 #!/bin/bash

#delete the service
kubectl delete -f service.yaml

#delete the deployment 
kubectl delete -f deployment.yaml 

#delete the configmap
kubectl delete -f grafana-datasource-config.yaml




