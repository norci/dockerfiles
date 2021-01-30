#!/bin/bash -eux
sudo nvidia-smi -c EXCLUSIVE_PROCESS

[ $(echo "get_server_list" | nvidia-cuda-mps-control) == ""  ] && sudo nvidia-cuda-mps-control -d


xhost +local:root
