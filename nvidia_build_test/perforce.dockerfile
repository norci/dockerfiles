FROM ubuntu:18.04
ENV DEBIAN_FRONTEND noninteractive
RUN set -x\
 && sed -i 's/archive.ubuntu.com/mirrors.huaweicloud.com/' /etc/apt/sources.list\
 && sed -i 's/security.ubuntu.com/mirrors.huaweicloud.com/' /etc/apt/sources.list\
 && apt-get -qq update\
 && apt-get -qq install --no-install-recommends ca-certificates gnupg wget sudo perl python python-dev python-crypto python-pip python-paramiko python-psutil python-setuptools\
 && python -m pip install -U pip\
 && python -m pip config set global.index-url https://mirrors.huaweicloud.com/repository/pypi/simple\
 && (for PKG in p4python==2017.2.1615960 ; do python -m pip install -U $PKG ; done)\
 && wget -q -O- https://package.perforce.com/perforce.pubkey | apt-key add -\
 && echo "deb http://package.perforce.com/apt/ubuntu bionic release" > /etc/apt/sources.list.d/perforce.list\
 && apt-get -qq update\
 && apt-get -qq install --no-install-recommends helix-cli\
 && apt-get -qq clean\
 && apt-get -qq autoremove\
 && rm -rf /var/lib/apt/lists/*\
 && rm -rf /root/.cache/\
 && useradd --groups sudo --gid users --create-home --shell /bin/bash devel\
 && echo 'devel ALL=NOPASSWD:ALL' >> /etc/sudoers.d/devel\
 && echo 'devel:devel' | chpasswd
#
USER devel
WORKDIR /home/devel
