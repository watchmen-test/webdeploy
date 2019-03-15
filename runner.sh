#!/usr/bin/env bash
# Simple run wrapper for docker webdeploy container.
# Assume container has been built (build.sh)
# See runner.sh to run the container local.
# See validate.sh to test version deployed by container.
export WEBDEPLOY_VERSION=v1
echo "[$0]:: Begin [$*]"
status=0

set -x;
docker run -d -p 9090:80 webdeploy:${WEBDEPLOY_VERSION}
status=$?
set +x

echo "[$0]:: End   [$status]"
exit $status