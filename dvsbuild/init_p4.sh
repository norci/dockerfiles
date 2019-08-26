#!/bin/bash -eux
##### clean up #####
rm -rf /p4/sw/
p4 login
p4 revert -k //...
p4 sync -qk //...#none
##### p4's maximum thread number is 10. #####
p4 sync //sw/misc/linux/unix-build

sudo chown 0:0 /p4/sw/misc/linux/unix-build
sudo chmod u+s /p4/sw/misc/linux/unix-build
