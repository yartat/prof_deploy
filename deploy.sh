#!/bin/bash

export DOCKER_ID_USER="yartat"

cat docker-deploy.yml \
    | sed -e 's!$DOCKER_APP_IMAGE_ID!$DOCKER_ID_USER/prof_app!' \
    | sed -e 's!$DOCKER_NGINX_IMAGE_ID!$DOCKER_ID_USER/prof_nginx!' \
    | sed -e 's!$DOCKER_DB_IMAGE_ID!$DOCKER_ID_USER/prof_mysql!' \
    > docker-compose.yml

#docker-compose -f deploy.v3.yml up -d
docker-compose run -d --service-ports prof_nginx
