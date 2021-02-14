#!/bin/bash -eux
#docker-compose build
# --volume=/tmp/.X11-unix:/tmp/.X11-unix

THREADS=$(lscpu | awk '/^CPU\(s\):/{print $NF}')
CORES=$(lscpu | awk '/^Core\(s\) per socket:/{print $NF}')
ARGS="
--detach
--env JULIA_NUM_THREADS=${THREADS}
--env OPENBLAS_NUM_THREADS=${CORES}
--env-file=env.txt
--expose=8080
--gpus=all
--interactive
--ipc=host
--name=julia
--publish 127.0.0.1:8080:8080
--restart=unless-stopped
--tmpfs=/run:rw,exec
--tmpfs=/tmp:rw,exec
--tty
--user $(id -u):$(id -g)
--volume=/etc/localtime:/etc/localtime:ro
--volume=`pwd`/config:/julia_depot/config
--volume=code-server_data:/home/coder/.local/share/code-server
--volume=code:/code
--volume=julia:/julia_depot
"
docker run ${ARGS} eordian/julia
docker cp ${HOME}/.ssh julia:/home/coder/.ssh
