#!/bin/bash

#Create a Namespace monitoring
#kubectl create namespace monitoring

#Create the role using the following command
kubectl create -f clusterRole.yaml

#Create the config map in Kubernetes
kubectl create -f config-map.yaml 

#Create a deployment 
kubectl create -f prometheus-deployment.yaml 

#Check the created deployment
#kubectl get deployments

#get the Prometheus pod name
#kubectl get pods 

#To acces the dashboard
#kubectl port-forward <prometheus-pod-name>

#Exposing Prometheus as a Service 
kubectl create -f prometheus-service.yaml