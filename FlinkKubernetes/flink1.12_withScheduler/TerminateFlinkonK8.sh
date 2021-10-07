 #!/bin/bash

kubectl delete -f jobmanager-service.yaml
kubectl delete -f flink-configuration-configmap.yaml
# if the rest service was created
kubectl delete -f jobmanager-rest-service.yaml
# if queryable state service was created
#kubectl delete -f taskmanager-query-state-service.yaml
# if a session cluster was deplyed
kubectl delete -f taskmanager-deployment.yaml
kubectl delete -f jobmanager-deployment.yaml
# if a job cluster was deplyed
#kubectl delete -f taskmanager-job-deployment.yaml
#kubectl delete -f jobmanager-job.yaml
