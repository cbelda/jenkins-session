#!/bin/bash

export CONTAINER_NAME="session"
export CONTAINER_PORT="9999"

# the .zip artifact should be already unzipped in the JENKINS-SESSION/ directory at this point
sudo docker rm -rf ${CONTAINER_NAME}
sudo docker run -d -it -p ${CONTAINER_PORT}:80 --name=${CONTAINER_NAME} cbelda/nginx4angular
sudo docker cp JENKINS-SESSION/. ${CONTAINER_NAME}:/usr/share/nginx/html/
