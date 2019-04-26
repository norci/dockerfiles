#!/bin/bash -eux
# docker-compose up -d
docker-compose exec perforce p4 login
##### p4's maximum thread number is 10.
docker-compose exec perforce p4 sync -q --parallel threads=8,batch=64 //sw/eris/... //sw/gpgpu/eris/cuda.vlcp
docker-compose exec perforce sed -i '352 a\
                args.append("--parallel")\
                args.append("threads=8,batch=64")' /p4/sw/eris/src/common/perforce.py
docker-compose exec perforce vulcan --sync ]=cublas_tests
docker-compose exec perforce vulcan --eris --install --target-revision=pkg-latest ]cuda
