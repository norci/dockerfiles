FROM nvcr.io/hpc/julia:v1.2.0

ENV NODE_MIRROR https://mirrors.huaweicloud.com/nodejs/

RUN set -eux\
	&& sed -i 's/archive.ubuntu.com/mirrors.huaweicloud.com/' /etc/apt/sources.list\
	&& sed -i 's/security.ubuntu.com/mirrors.huaweicloud.com/' /etc/apt/sources.list\
	&& apt-get -qq update\
	&& apt-get -qq install --no-install-recommends ca-certificates curl git ssh sudo byobu unzip\
	&& apt-get -qq clean\
	&& apt-get -qq autoremove\
	&& rm -rf /var/lib/apt/lists/*\
	&& useradd --groups sudo --gid users --no-create-home --no-user-group --shell /bin/bash devel\
	&& echo 'devel ALL=NOPASSWD:ALL' >> /etc/sudoers.d/devel\
	&& echo 'devel:devel' | chpasswd

USER devel
WORKDIR /home/devel
COPY init.jl /data/
