#!/bin/bash -eux

docker run \
--expose 6006 \
-p 6006:6006 \
--detach \
-v $1:/log:ro \
tensorflow/tensorflow \
tensorboard \
--bind_all \
--logdir /log
