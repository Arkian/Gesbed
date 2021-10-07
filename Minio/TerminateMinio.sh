 #!/bin/bash

kubectl delete -f minio-service.yaml

kubectl delete -f minio-deployment.yaml

kubectl delete -f minio-pvc.yaml

kubectl delete -f minio-pv.yaml



