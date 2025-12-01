FROM public.ecr.aws/lambda/nodejs:22.2025.05.04.04-x86_64

# Enables building yarn native dependencies
RUN dnf -y install python3
RUN dnf -y install pkgconfig make gcc-c++

# Install yarn itself
RUN npm install --location=global yarn

# Specifically for building canvas
RUN dnf -y install cairo-devel pango-devel libjpeg-turbo-devel giflib-devel

# Install Chrome - libXScrnSaver is there to bring in libxss1 which chrome needs but does not install
#RUN dnf -y install amazon-linux-extras
#RUN amazon-linux-extras install epel -y
#RUN dnf -y install chromium chromedriver
#RUN dnf -y install libXScrnSaver

#  Copy in the handler
COPY lambda-bootstrap-shell.sh ${LAMBDA_TASK_ROOT}

ENTRYPOINT ["sh","/var/task/lambda-bootstrap-shell.sh"]
#CMD [ "modules/api/dist/lambda.handler" ]
