#!/usr/bin/env bash
# Simple publish wrapper for docker webdeploy container: simply pushes container up to docker hub after login)
# Assumes local version of container has been built.
# The fully qualified image name tag information are passed along the command line.
export WEBDEPLOY_IMAGE_ID=$1
export WEBDEPLOY_IMAGE_NAME=$2
export WEBDEPLOY_IMAGE_TAG=$3

echo "[$0]:: Begin [$*]"
status=0

if [ -z "${WEBDEPLOY_IMAGE_ID}" -o -z "${WEBDEPLOY_IMAGE_NAME}" -o -z "${WEBDEPLOY_IMAGE_TAG}" ]; then
  status=1
  echo "[$0]:: FAIL Missing arguments..."
  printenv| grep WEBDEPLOY_IMAGE|sort
  exit $status
fi


echo "[$0]:: Processing..."
printenv| grep WEBDEPLOY_IMAGE|sort

# Tag
set -x; docker tag ${WEBDEPLOY_IMAGE_ID} ${WEBDEPLOY_IMAGE_NAME}:${WEBDEPLOY_IMAGE_TAG}; status=$?; set +x
if [ $status -ne 0 ] ; then
 echo "[$0]:: Local tagging failed..."
else
   # Push to Docker Hub: assumes already logged in...
  set -x; docker push ${WEBDEPLOY_IMAGE_NAME}; status=$?; set +x
  if [ $status -ne 0 ] ; then
   echo "[$0]:: Docker Hub Push failed..."
  fi
fi

echo "[$0]:: End  [$status]"
exit $status