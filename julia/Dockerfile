FROM julia

# CUDA.jl recommends cuDNN. but download the binary package from github is too slow, so use docker image instead.
FROM nvidia/cuda:11.1.1-cudnn8-devel

COPY --from=julia /usr/local/julia /usr/local/julia

RUN set -eux\
	&& sed -i 's@archive.ubuntu.com@ftp.sjtu.edu.cn@' /etc/apt/sources.list\
	&& sed -i 's@security.ubuntu.com@ftp.sjtu.edu.cn@' /etc/apt/sources.list\
	&& sed -i 's@^@#@' /etc/apt/sources.list.d/nvidia-ml.list \
	&& sed -i 's@^@#@' /etc/apt/sources.list.d/cuda.list \
	&& apt-get -qq update\
	&& DEBIAN_FRONTEND=noninteractive apt-get -qq install --no-install-recommends \
	ca-certificates curl git peco ssh unzip \
	libqt5widgets5 \
	pkg-config libglvnd-dev libgl1-mesa-dev libegl1-mesa-dev libgles2-mesa-dev mesa-utils \
	&& apt-get -qq clean\
	&& apt-get -qq autoremove\
	&& rm -rf /var/lib/apt/lists/*

# https://docs.conda.io/projects/conda/en/latest/user-guide/configuration/use-condarc.html
COPY .condarc /etc/conda/
COPY pip.conf /etc/
COPY gitconfig /etc/

WORKDIR /root
CMD ["bash", "-l"]
