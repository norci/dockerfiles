#!/bin/bash -eux
docker \
run \
--detach \
--env-file=env.txt \
--gpus=all \
--interactive \
--name=julia \
--tmpfs=/run:rw,exec \
--tmpfs=/tmp:rw,exec \
--tty \
-v /etc/localtime:/etc/localtime:ro \
--volume=/tmp/.X11-unix:/tmp/.X11-unix \
--volume=julia:/root/ \
--volume=`pwd`:/dockerfile:ro \
--volume=`pwd`/config:/root/.julia/config \
--volume=$HOME/.ssh:/root/.ssh \
eordian/julia
