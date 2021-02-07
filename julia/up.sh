#!/bin/bash -eux
../setup_cuda_mps.sh

ARGS="
--detach
--env-file=env.txt
--expose=22
--gpus=all
--interactive
--ipc=host
--name=julia
--restart=unless-stopped
--publish 0.0.0.0:8022:22
--tmpfs=/run:rw,exec
--tmpfs=/tmp:rw,exec
--tty
--volume=/etc/localtime:/etc/localtime:ro
--volume=/tmp/.X11-unix:/tmp/.X11-unix
--volume=`pwd`/config:/root/.julia/config
--volume=code:/code
--volume=julia:/root/.julia
"
docker run ${ARGS} eordian/julia

docker exec julia mkdir -p /root/.ssh
docker cp ~/.ssh/authorized_keys julia:/root/.ssh/
docker cp ~/.emacs.d julia:/root/
