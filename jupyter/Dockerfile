FROM ubuntu
ENV DEBIAN_FRONTEND noninteractive
RUN set -x\
	&& sed -i 's/archive.ubuntu.com/mirrors.huaweicloud.com/' /etc/apt/sources.list\
	&& sed -i 's/security.ubuntu.com/mirrors.huaweicloud.com/' /etc/apt/sources.list\
	&& apt-get -qq update\
	&& apt-get -qq install --no-install-recommends \
	ca-certificates\
	gnupg\
	nodejs npm\
	python-pip\
	python3-pip\
	sudo\
	&& apt-get -qq clean\
	&& apt-get -qq autoremove\
	&& rm -rf /var/lib/apt/lists/*\
	&& rm -rf /root/.cache/\
	&& useradd --groups sudo --gid users --create-home --shell /bin/bash devel\
	&& echo 'devel ALL=NOPASSWD:ALL' >> /etc/sudoers.d/devel\
	&& echo 'devel:devel' | chpasswd

USER devel
RUN  python  -m pip install -qqU --user pip\
	&& python3 -m pip install -qqU --user pip\
	&& python  -m pip config -qq set global.index-url https://mirrors.huaweicloud.com/repository/pypi/simple\
	&& python3 -m pip config -qq set global.index-url https://mirrors.huaweicloud.com/repository/pypi/simple\
	&& for P in setuptools jupyter jupyterlab; do python3 -m pip install -qq --no-cache-dir --user $P ; done\
	&& mkdir /home/devel/.jupyter/
ENV NODE_MIRROR https://mirrors.huaweicloud.com/nodejs/
