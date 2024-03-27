#!/bin/bash

export POD_NAME=$(kubectl get pods --namespace default -l "app.kubernetes.io/name=wordpress,app.kubernetes.io/instance=wordpress" -o jsonpath="{.items[0].metadata.name}")
export CONTAINER_PORT=$(kubectl get pod --namespace default $POD_NAME -o jsonpath="{.spec.containers[0].ports[0].containerPort}")
echo "Visit http://127.0.0.1:8089 to use your application"
kubectl --namespace default port-forward $POD_NAME 8089:$CONTAINER_PORT