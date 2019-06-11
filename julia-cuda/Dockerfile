FROM nvidia/cuda:10.1-cudnn7-devel

# ffmpeg for Plots.jl.
# libpixman-1-dev for Cairo

RUN set -eux\
	&& sed -i 's/archive.ubuntu.com/mirrors.huaweicloud.com/' /etc/apt/sources.list\
	&& sed -i 's/security.ubuntu.com/mirrors.huaweicloud.com/' /etc/apt/sources.list\
	&& apt-get -qq update\
	&& apt-get -qq install --no-install-recommends \
	ca-certificates curl git ssh sudo byobu unzip\
	zlib1g-dev ffmpeg pkg-config hdf5-tools libffi-dev libpng-dev\
	texlive-xetex texlive-fonts-recommended lmodern texlive-plain-generic\
	libpoppler-dev libpixman-1-dev\
	inkscape\
	&& apt-get -qq clean\
	&& apt-get -qq autoremove\
	&& rm -rf /var/lib/apt/lists/*\
	&& useradd --groups sudo --gid users --no-create-home --no-user-group --shell /bin/bash devel\
	&& echo 'devel ALL=NOPASSWD:ALL' >> /etc/sudoers.d/devel\
	&& echo 'devel:devel' | chpasswd

ADD https://julialang-s3.julialang.org/bin/linux/x64/1.1/julia-1.1.1-linux-x86_64.tar.gz /tmp/

RUN cat /tmp/julia-1.1.1-linux-x86_64.tar.gz | tar zxf - -C /usr/local/ --strip-components 1 \
	&& rm /tmp/julia-1.1.1-linux-x86_64.tar.gz

USER devel
WORKDIR /home/devel

ENV NODE_MIRROR https://mirrors.huaweicloud.com/nodejs/
