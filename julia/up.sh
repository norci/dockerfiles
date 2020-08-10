#!/bin/bash -eux
docker \
run \
--detach \
--env-file=env.txt \
--gpus=all \
--interactive \
--name=julia \
--rm \
--tmpfs=/run:rw,exec \
--tmpfs=/tmp:rw,exec \
--tty \
--volume=/tmp/.X11-unix:/tmp/.X11-unix \
--volume=`pwd`:/config:ro \
--volume=$HOME/.ssh:/root/.ssh \
--volume=julia:/root/ \
eordian/julia
