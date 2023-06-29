#!/bin/bash

cd `dirname $0`

CONTEXT_ROOT=$(dirname $(pwd))

. "${CONTEXT_ROOT}/.env"
if [ "$?" != "0" ]; then
    exit 1
fi
export SERVER_NAME=${SERVER_NAME:?}

envsubst '${SERVER_NAME}' < "${CONTEXT_ROOT}/loki.conf.template" > "${CONTEXT_ROOT}/loki.conf"
