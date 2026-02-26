FROM public.ecr.aws/lambda/nodejs:24.2026.02.24.20-x86_64

# Enables building yarn native dependencies
RUN dnf -y install python3
RUN dnf -y install pkgconfig make gcc-c++

# Install pnpm itself
RUN npm install --location=global pnpm

# Specifically for building canvas
RUN dnf -y install cairo-devel pango-devel libjpeg-turbo-devel giflib-devel

#  Copy in the handler
COPY lambda-bootstrap-shell.sh ${LAMBDA_TASK_ROOT}

ENTRYPOINT ["sh","/var/task/lambda-bootstrap-shell.sh"]
#CMD [ "modules/api/dist/lambda.handler" ]
