#!/bin/bash

#Create the configmap
kubectl create -f grafana-datasource-config.yaml

#Create the deployment 
kubectl create -f deployment.yaml 

#Create the service
kubectl create -f service.yaml
