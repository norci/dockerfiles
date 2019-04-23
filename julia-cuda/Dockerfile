FROM nvidia/cuda:10.1-cudnn7-devel

# ffmpeg for Plots.jl.

RUN set -eux; \
	apt-get -qq update \
	&& apt-get -qq install --no-install-recommends \
	ca-certificates \
	curl \
	git \
	ssh \
	sudo \
	tmux byobu \
	unzip \
	zlib1g-dev ffmpeg\
	&& apt-get -qq clean \
	&& apt-get -qq autoremove \
	&& rm -rf /var/lib/apt/lists/* \
	&& useradd --groups sudo --gid users --no-create-home --no-user-group --shell /bin/bash devel \
	&& echo 'devel ALL=NOPASSWD:ALL' >> /etc/sudoers.d/devel \
	&& echo 'devel:devel' | chpasswd

RUN curl -fL \
	https://julialang-s3.julialang.org/bin/linux/x64/1.1/julia-1.1.0-linux-x86_64.tar.gz \
	| tar zxf - -C /usr/local/ --strip-components 1

USER devel
WORKDIR /home/devel
