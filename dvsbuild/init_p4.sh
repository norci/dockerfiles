#!/bin/bash -eux
sudo chmod 777 /p4 /home/jovyan/.vulcan
##### clean up #####
rm -rf /p4/sw/
p4 login
p4 revert -k //...
p4 sync -qk //...#none
##### p4's maximum thread number is 10. #####
p4 sync -q --parallel threads=10,batch=32 //sw/eris/... //sw/gpgpu/eris/cuda.vlcp
p4 sync -q -f //sw/eris/src/common/perforce.py

sed -i '352 a\
                args.append("--parallel")\
                args.append("threads=10,batch=32")' /p4/sw/eris/src/common/perforce.py

/p4/sw/eris/bin/vulcan -qq --sync ]=cublas_tests
/p4/sw/eris/bin/vulcan -qq --eris --install --target-revision=pkg-latest ]cuda

p4 sync //sw/misc/linux/unix-build

sudo chown 0:0 /p4/sw/misc/linux/unix-build
sudo chmod u+s /p4/sw/misc/linux/unix-build
