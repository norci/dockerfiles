#!/bin/bash -eux
sudo mount -t cifs //netapp-zj/swqa_test netapp-zj -o domain=nvidia.com,username=josephx,vers=1.0,iocharset=cp936,uid=1000,gid=100
