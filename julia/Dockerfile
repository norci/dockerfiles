FROM codercom/code-server AS CS
FROM julia:1.6 AS JL

# CUDA.jl recommends cuDNN. but download the binary package from github is too slow, so use docker image instead.
FROM nvidia/cuda:11.2.0-cudnn8-devel

COPY --from=JL /usr/local/julia /usr/local/julia
COPY --from=CS /usr/lib/code-server/ /usr/lib/code-server/
COPY --from=CS /usr/bin/code-server  /usr/bin/code-server

RUN set -eux\
	&& sed -i 's@archive.ubuntu.com@ftp.sjtu.edu.cn@' /etc/apt/sources.list\
	&& sed -i 's@security.ubuntu.com@ftp.sjtu.edu.cn@' /etc/apt/sources.list\
	&& sed -i 's@^@#@' /etc/apt/sources.list.d/nvidia-ml.list \
	&& sed -i 's@^@#@' /etc/apt/sources.list.d/cuda.list \
	&& apt-get -qq update\
	&& apt-get -qq install --no-install-recommends apt-utils \
	&& DEBIAN_FRONTEND=noninteractive \
	apt-get -qq install --no-install-recommends \
	ca-certificates curl git keychain locales-all peco ssh unzip \
	libqt5widgets5 \
	pkg-config libglvnd-dev libgl1-mesa-dev libegl1-mesa-dev libgles2-mesa-dev mesa-utils \
	libglfw3-dev \
	&& apt-get -qq clean\
	&& apt-get -qq autoremove\
	&& rm -rf /var/lib/apt/lists/*\
	&& sed -i '$a PermitRootLogin yes' /etc/ssh/sshd_config \
	&& ln -s /usr/local/julia/bin/julia /usr/local/bin/julia

RUN sed -i '$a eval `keychain --eval id_rsa`' /root/.bashrc

# https://docs.conda.io/projects/conda/en/latest/user-guide/configuration/use-condarc.html
COPY .condarc /etc/conda/
COPY pip.conf /etc/
COPY gitconfig /etc/
COPY cmd.sh /root/
COPY code_config.yaml /root/.config/code-server/config.yaml
WORKDIR /root
CMD /root/cmd.sh
