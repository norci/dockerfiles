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
--gpus=all
--interactive
--ipc=host
--name=julia
--network=host
--restart=unless-stopped
--tmpfs=/run:rw,exec
--tmpfs=/tmp:rw,exec
--tty
--volume=/etc/localtime:/etc/localtime:ro
--volume=`pwd`/config:/julia_depot/config
--volume=code:/code
--volume=julia:/julia_depot
"
docker run ${ARGS} eordian/julia bash
docker cp ${HOME}/.ssh julia:/root/.ssh
docker exec julia chown -R 0:0 /root/.ssh
