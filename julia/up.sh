#!/bin/bash -eux
docker-compose build

ARGS="
--detach
--env-file=env.txt
--expose=22
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
--volume=$HOME/.emacs.d/:/root/.emacs.d/
--volume=/etc/localtime:/etc/localtime:ro
--volume=/tmp/.X11-unix:/tmp/.X11-unix
--volume=`pwd`/config:/root/.julia/config
--volume=code-server_data:/root/.local/share/code-server
--volume=code:/code
--volume=julia:/root/.julia
"
docker run ${ARGS} eordian/julia
docker cp ~/.ssh/ julia:/root/.ssh/
