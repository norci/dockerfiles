#!/bin/bash -eux
docker-compose up -d
docker-compose exec dvsbuild jupyter notebook password
docker-compose restart
docker-compose ps
