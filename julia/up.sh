#!/bin/bash -eux
xhost +local:root

ARGS="
--detach
--env-file=env.txt
--gpus=all
--interactive
--name=julia
--tmpfs=/run:rw,exec
--tmpfs=/tmp:rw,exec
--tty
--volume=$HOME/.ssh:/root/.ssh:ro
--volume=/etc/localtime:/etc/localtime:ro
--volume=/tmp/.X11-unix:/tmp/.X11-unix
--volume=`pwd`/config:/root/.julia/config
--volume=code:/code
--volume=julia:/root/.julia
eordian/julia
"

docker run ${ARGS}
