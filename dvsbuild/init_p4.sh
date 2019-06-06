#!/bin/bash -eux
sudo chmod 777 /p4
p4 login
##### p4's maximum thread number is 10.
p4 sync -q -f /p4/sw/eris/src/common/perforce.py
p4 sync -q --parallel threads=10,batch=32 //sw/eris/... //sw/gpgpu/eris/cuda.vlcp
sed -i '352 a\
                args.append("--parallel")\
                args.append("threads=10,batch=32")' /p4/sw/eris/src/common/perforce.py
vulcan --quiet --sync ]=cublas_tests
vulcan --eris --install --target-revision=pkg-latest ]cuda
