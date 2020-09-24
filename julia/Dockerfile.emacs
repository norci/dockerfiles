FROM julia AS JL
FROM nvidia/cuda:11.0-cudnn8-devel-ubuntu18.04 AS NV
FROM silex/emacs
# TODO: this lacks opengl driver. which is in nvidia/cuda

COPY --from=NV /usr/local /usr/local
COPY --from=JL /usr/local/julia /usr/local/julia

RUN set -eux\
	&& sed -i 's@archive.ubuntu.com@mirrors.huaweicloud.com@' /etc/apt/sources.list\
	&& sed -i 's@security.ubuntu.com@mirrors.huaweicloud.com@' /etc/apt/sources.list\
	&& apt-get -qq update\
	&& apt-get -qq install --no-install-recommends \
	ca-certificates curl git peco ssh unzip \
	libqt5widgets5 \
	pkg-config libglvnd-dev libgl1-mesa-dev libegl1-mesa-dev libgles2-mesa-dev mesa-utils \
	&& apt-get -qq clean\
	&& apt-get -qq autoremove\
	&& rm -rf /var/lib/apt/lists/*

# https://docs.conda.io/projects/conda/en/latest/user-guide/configuration/use-condarc.html
COPY .condarc /etc/conda/condarc
COPY pip.conf /etc/pip.conf
COPY gitconfig /etc/

WORKDIR /root
CMD ["bash", "-l"]
