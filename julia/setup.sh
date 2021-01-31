#!/bin/bash -x
sudo nvidia-smi -c EXCLUSIVE_PROCESS
sudo nvidia-cuda-mps-control -d
xhost +local:root
