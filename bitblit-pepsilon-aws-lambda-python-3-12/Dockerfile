FROM public.ecr.aws/lambda/python:3.12.2025.02.25.16

#  Copy in the handler
COPY lambda-bootstrap-shell.sh ${LAMBDA_TASK_ROOT}

ENTRYPOINT ["sh","/var/task/lambda-bootstrap-shell.sh"]
#CMD [ "modules/api/dist/lambda.handler" ]
