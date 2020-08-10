FROM julia

# CUDA.jl recommends cuDNN. but download the binary package from github is too slow, so use docker image instead.
FROM nvidia/cuda:11.0-cudnn8-devel-ubuntu18.04

COPY --from=julia /usr/local/julia /usr/local/julia

RUN set -eux\
	&& sed -i 's@archive.ubuntu.com@mirrors.huaweicloud.com@' /etc/apt/sources.list\
	&& sed -i 's@security.ubuntu.com@mirrors.huaweicloud.com@' /etc/apt/sources.list\
	&& apt-get -qq update\
	&& apt-get -qq install --no-install-recommends ca-certificates curl git peco ssh unzip\
	&& apt-get -qq clean\
	&& apt-get -qq autoremove\
	&& rm -rf /var/lib/apt/lists/*

# https://docs.conda.io/projects/conda/en/latest/user-guide/configuration/use-condarc.html
COPY .condarc /etc/conda/
COPY pip.conf /etc/
COPY gitconfig /etc/

WORKDIR /root
CMD ["bash", "-l"]