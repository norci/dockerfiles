#!/bin/bash -eux
docker-compose run --rm julia julia --load /tmp/julia-cuda/init.jl
docker-compose up -d
