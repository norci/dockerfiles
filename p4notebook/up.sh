#!/bin/bash -eux
docker-compose up -d
docker-compose exec $1 jupyter notebook password
docker-compose restart $1
