#!/bin/sh
# Based on the default script in public.ecr.aws/lambda/nodejs:16, which is copyright 2020 Amazon.com, Inc. or its affiliates. All Rights Reserved.
# Modifications copyright Christopher Weiss, 2022

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
    echo "Running Epsilon inside AWS batch - triggering direct $1 $2"
    exec node dist/aws-batch-cli.js --process $1 --data $2
fi

