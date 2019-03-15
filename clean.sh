#!/usr/bin/env bash
# Simple cleanup wrapper for webdeploy (kubernetes, minikube cluster).
# Deletes the service and deployment created by deploy.sh
#


echo "[$0]:: Begin [$*]"
status=0

set -x
kubectl delete service    webdeploy-service
kubectl delete deployment webdeploy
set +x

echo "[$0]:: End   [$status]"
exit $status
