#!/bin/sh
# Based on the default script in public.ecr.aws/lambda/python:3.12.2025.02.25.16, which is copyright 2020 Amazon.com, Inc. or its affiliates. All Rights Reserved.
# Modifications copyright Christopher Weiss, 2025

if [ -z "${EPSILON_RUNNING_IN_AWS_BATCH}" ]; then
    if [ $# -lt 1 ]; then
      echo "entrypoint requires the handler name to be the first argument" 1>&2
      exit 142
    fi
    export _HANDLER="$1"

    RUNTIME_ENTRYPOINT=/var/runtime/bootstrap
    if [ -z "${AWS_LAMBDA_RUNTIME_API}" ]; then
      exec /usr/local/bin/aws-lambda-rie $RUNTIME_ENTRYPOINT
    else
      exec $RUNTIME_ENTRYPOINT
    fi
  else
    echo "Running Epsilon inside AWS batch - triggering direct $1 $2 $3 $4 $5 : $EPSILON_AWS_BATCH_CLI_PY_PATH"
    exec python $EPSILON_AWS_BATCH_CLI_PY_PATH --process $1 --taskDataBase64 $2 --traceId $3 --traceDepth $4 --taskMetaDataBase64 $5
fi

