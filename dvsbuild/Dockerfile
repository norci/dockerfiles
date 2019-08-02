# FROM jupyter/minimal-notebook
FROM eordian/datascience-notebook
USER root

COPY perforce.pubkey /tmp/perforce.pubkey

RUN set -eux;\
	sed -i 's/archive.ubuntu.com/mirrors.huaweicloud.com/' /etc/apt/sources.list;\
	sed -i 's/security.ubuntu.com/mirrors.huaweicloud.com/' /etc/apt/sources.list;\
	apt-get -qq update;\
	apt-get -qq install --no-install-recommends gnupg;\
	apt-key add /tmp/perforce.pubkey;\
	echo "deb http://package.perforce.com/apt/ubuntu bionic release" > /etc/apt/sources.list.d/perforce.list;\
	apt-get -qq update;\
	apt-get -qq install --no-install-recommends helix-cli g++ gcc gdb make libc6-i386 netbase gnupg perl python-pip;\
	apt-get -qq clean;\
	apt-get -qq autoremove;\
	rm -rf /var/lib/apt/lists/*;\
	rm -rf /root/.cache/ /tmp/perforce.pubkey;\
	usermod -aG sudo jovyan;\
	echo 'jovyan ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/jovyan

USER jovyan

## for vulcan
RUN set -eux;\
	for P in \
	pip setuptools ipykernel p4python==2017.2.1615960 pycrypto paramiko psutil pandas;\
	do python2 -m pip install -U --no-cache-dir --user -q $P;\
	done; \
	python2 -m ipykernel install --user

# p4python has a bug.
# RUN set -eux;\
#	for P in pip setuptools wheel p4python;\
#	do python3 -m pip install --no-warn-script-location -U --no-cache-dir --user -q $P;\
#	done

