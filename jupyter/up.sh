#!/bin/bash -eux
docker-compose up -d
docker-compose exec jupyter jupyter notebook password
docker-compose restart
docker-compose ps
