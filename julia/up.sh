#!/bin/bash -eux
. setup.sh

ARGS="
--detach
--env-file=env.txt
--expose=22
--publish 0.0.0.0:8022:22
--gpus=all
--ipc=host
--interactive
--name=julia
--tmpfs=/run:rw,exec
--tmpfs=/tmp:rw,exec
--tty
--volume=$HOME/.emacs.d:/root/.emacs.d
--volume=$HOME/.ssh:/root/.ssh:ro
--volume=/etc/localtime:/etc/localtime:ro
--volume=/tmp/.X11-unix:/tmp/.X11-unix
--volume=`pwd`/config:/root/.julia/config
--volume=code:/code
--volume=julia:/root/.julia
eordian/julia
"

docker run ${ARGS}
