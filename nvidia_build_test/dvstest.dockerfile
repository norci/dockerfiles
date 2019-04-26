FROM nvidia/cuda:10.1-base

RUN set -x\
 && sed -i 's/archive.ubuntu.com/mirrors.huaweicloud.com/' /etc/apt/sources.list\
 && sed -i 's/security.ubuntu.com/mirrors.huaweicloud.com/' /etc/apt/sources.list\
 && apt-get -qq update\
 && apt-get -qq install --no-install-recommends sudo gdb\
 && apt-get -qq clean\
 && apt-get -qq autoremove\
 && rm -rf /var/lib/apt/lists/*\
 && useradd --groups sudo --gid users --create-home --shell /bin/bash devel\
 && echo 'devel ALL=NOPASSWD:ALL' >> /etc/sudoers.d/devel\
 && echo 'devel:devel' | chpasswd
#
USER devel
WORKDIR /home/devel
