# DockMe
My docker images for public consumption

## Deployment of new images to Dockerhub
See : https://ropenscilabs.github.io/r-docker-tutorial/04-Dockerhub.html

Roughly:
1. Build the image (note the image id)
1. Log in to Dockerhub and create a repo (if you haven't already)
1. Tag the image : **docker tag DOCKER_HASH DOCKER_NAME:latest** 
   * e.g., **docker tag 70d42dbe4246 bitblit/circleci-node-8.11-java-10.0.1-python-3.7-elastic-beanstalk:latest**
1. Push the image to the repo  e.g. **docker push bitblit/circleci-node-8.11-java-10.0.1-python-3.7-elastic-beanstalk**


## bitblit-circleci-node-8.11-java-10.0.1

This image is for my CircleCI builds that need to have both NodeJS and Java - which is anything where I am building
a Typescript based API Gateway + its client libraries, for which I use the OpenAPI generator.  Also includes the
AWS CLI, for obvious reasons.

### bitblit-circleci-node-8.11-java-10.0.1-ruby-2.3.8

Same as above, but also includes Ruby and Bundler for cases when those are necessary.

### bitblit-circleci-node-8.11-java-10.0.1-python-3.7-elastic-beanstalk

Same as bitblit-circleci-node-8.11-java-10.0.1, but includes Python 3.5 (Yeah, this
is an error for the moment) and the AWS elastic beanstalk cli.

### bitblit-php-7.3.3-apache-gd-ffmpg-mysql

This image was originally for Adomni - sets up a LAMP server (Linux/Apache/Mysql/Php) with built in support
for GD (the graphics library), ffmpg (for video manipulation) and mysql.

### bitblit-php-7.3-swoole-4.2.9-composer

This image also originally built for Adomni (edge) and has php with swoole (the API serving library) and composer
support built in.