#!/bin/bash

export DOCKER_ID_USER="yartat"

docker login
cat docker-deploy-first-start.yml \
    | sed -e 's!$DOCKER_APP_IMAGE_ID!$DOCKER_ID_USER/prof_app!' \
    | sed -e 's!$DOCKER_NGINX_IMAGE_ID!$DOCKER_ID_USER/prof_nginx!' \
    | sed -e 's!$DOCKER_DB_IMAGE_ID!$DOCKER_ID_USER/prof_mysql!' \
    > deploy-first-start.yml

docker-compose -f deploy-first-start.yml up
