#!/bin/bash -x
sudo nvidia-smi -c EXCLUSIVE_PROCESS
set +e
sudo nvidia-cuda-mps-control -d
xhost +local:root
set -e
