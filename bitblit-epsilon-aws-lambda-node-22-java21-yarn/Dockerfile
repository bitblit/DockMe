FROM public.ecr.aws/lambda/nodejs:22.2025.05.04.04-x86_64

RUN dnf install -y java-21-amazon-corretto-devel

# Install yarn itself
RUN npm install --location=global yarn

#  Copy in the handler
COPY lambda-bootstrap-shell.sh ${LAMBDA_TASK_ROOT}

ENTRYPOINT ["sh","/var/task/lambda-bootstrap-shell.sh"]
#CMD [ "modules/api/dist/lambda.handler" ]
