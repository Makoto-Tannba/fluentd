#!/bin/bash

cd `dirname $0`

CONTEXT_ROOT=$(dirname $(pwd))

SUCCEEDED="undefined"

onexit() {
    if [ "${SUCCEEDED}" = "true" ]; then
        exit 0
    fi
    echo "Failed to start fluentd."
    exit 1
}

trap 'onexit' EXIT

cd ${CONTEXT_ROOT}

docker compose up -d fluentd && \
SUCCEEDED="true"
