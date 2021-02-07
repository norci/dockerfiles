#!/bin/bash -eux
ARGS="
--detach
--expose=6006
--interactive
--name=tensorboard
--restart=unless-stopped
--publish=0.0.0.0:6006:6006
--tty
--user=$(id -u):$(id -g)
--volume=code:/code:ro
--entrypoint /code/tensorboard.sh
"

docker run ${ARGS} tensorflow/tensorflow:latest
