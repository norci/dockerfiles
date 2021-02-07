#!/bin/bash -eux
ARGS="
--detach
--expose=6006
--interactive
--name=tensorboard
--restart=unless-stopped
--publish=127.0.0.1:6006:6006
--tty
--user=$(id -u):$(id -g)
--volume=code:/code:ro
"

docker run ${ARGS} tensorflow/tensorflow:latest
