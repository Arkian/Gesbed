 #!/bin/bash

kubectl create -f minio-pv.yaml

kubectl create -f minio-pvc.yaml

kubectl create -f minio-deployment.yaml

kubectl create -f minio-service.yaml
