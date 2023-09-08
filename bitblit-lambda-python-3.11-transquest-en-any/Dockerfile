FROM public.ecr.aws/lambda/python:3.11

LABEL Description="Chris weiss sample transquest server"

RUN python --version

# Enables building native dependencies
RUN yum install wget nano tar gzip -y

# Bring in monotransquest
RUN pip3 install torch transquest

# Copy setup code
COPY python/setup_models.py ${LAMBDA_TASK_ROOT}

# Run setup to cache the model
RUN python ${LAMBDA_TASK_ROOT}/setup_models.py

# App specific pip imports
RUN pip3 install jsonpickle aws_xray_sdk boto3
RUN mkdir /opt/extensions

# Copy function code
COPY python/app.py ${LAMBDA_TASK_ROOT}

# Set the CMD to your handler (could also be done as a parameter override outside of the Dockerfile)
CMD [ "app.handler" ]