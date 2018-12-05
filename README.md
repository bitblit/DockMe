# DockMe
My docker images for public consumption

## Deployment of new images to Dockerhub
See : https://ropenscilabs.github.io/r-docker-tutorial/04-Dockerhub.html


## bitblit-circleci-node-8.11-java-10.0.1

This image is for my CircleCI builds that need to have both NodeJS and Java - which is anything where I am building
a Typescript based API Gateway + its client libraries, for which I use the OpenAPI generator.  Also includes the
AWS CLI, for obvious reasons.

### bitblit-circleci-node-8.11-java-10.0.1-ruby-2.3.8

Same as above, but also includes Ruby and Bundler for cases when those are necessary.

