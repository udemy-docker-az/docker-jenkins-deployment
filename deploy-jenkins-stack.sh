#!/bin/sh

DATE=$(date -I)

docker build . --no-cache -t jamessmith52963/jenkins:$DATE
docker tag jamessmith52963/jenkins:$DATE jamessmith52963/jenkins:lts 
docker tag jamessmith52963/jenkins:$DATE jamessmith52963/jenkins:latest

docker push jamessmith52963/jenkins:$DATE
docker push jamessmith52963/jenkins:latest
docker push jamessmith52963/jenkins:lts

docker stack rm jenkins
sleep 15

docker stack deploy -c docker-compose.yml jenkins
