#!/bin/bash

cd `dirname $0`

CONTEXT_ROOT=$(dirname $(pwd))

SUCCEEDED="undefined"

onexit() {
    if [ "${SUCCEEDED}" = "true" ]; then
        exit 0
    fi
    echo "Failed to stop fluentd."
    exit 1
}

trap 'onexit' EXIT

cd ${CONTEXT_ROOT}

docker compose stop fluentd && \
docker compose rm -f fluentd && \
SUCCEEDED="true"
