#!/bin/bash
set -e

echo ">> Converting environment variables"
source /opt/credentials_env_variables.sh

echo ">> Building poetry package"
/opt/poetry/bin/poetry build

echo ">> Uploading poetry package"
/opt/poetry/bin/poetry publish -n ${PUBLISH_REPO_CMDLINE}