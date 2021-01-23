#!/bin/bash -eux
xhost +local:root

ARGS="
-u $(id -u):$(id -g)
--detach
--env-file=env.txt
--gpus=all
--interactive
--name=julia
--privileged
--tmpfs=/run:rw,exec
--tmpfs=/tmp:rw,exec
--tty
--volume=/etc/localtime:/etc/localtime:ro
--volume=/tmp/.X11-unix:/tmp/.X11-unix
--volume=`pwd`:/dockerfile:ro
--volume=`pwd`/config:/root/.julia/config
--volume=$HOME/.ssh:/root/.ssh:ro
--volume=julia:/root/.julia
--volume=code:/code
eordian/julia
"

docker run ${ARGS}