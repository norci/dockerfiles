#!/bin/bash -eux
ARGS="
-u $(id -u):$(id -g)
-it
--name tensorboard
--expose 6006
-p 6006:6006
--detach
-v code:/code:ro
tensorflow/tensorflow:latest
"

docker run ${ARGS}
