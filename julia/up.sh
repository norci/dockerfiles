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
--publish 0.0.0.0:8022:22
--restart=unless-stopped
--tmpfs=/run:rw,exec
--tmpfs=/tmp:rw,exec
--tty
--volume=/etc/localtime:/etc/localtime:ro
--volume=/tmp/.X11-unix:/tmp/.X11-unix
--volume=`pwd`/config:/root/.julia/config
--volume=code-server_config/:/root/.config/code-server/
--volume=code-server_data:/root/.local/share/code-server
--volume=code:/code
--volume=julia:/root/.julia
"
docker run ${ARGS} eordian/julia
docker cp ~/.ssh/ julia:/root/.ssh/
