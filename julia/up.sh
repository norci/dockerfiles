#!/bin/bash -eux
docker \
    run \
    --gpus all \
    --rm \
    -it \
    --env-file=env.txt \
    --tmpfs=/tmp:rw,exec \
    --tmpfs=/run:rw,exec \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v julia:/root/ \
    -v `pwd`:/config:ro \
    eordian/julia \
    bash

#     --dns=8.8.8.8 \
