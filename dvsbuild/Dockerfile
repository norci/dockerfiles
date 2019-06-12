FROM jupyter
USER root
ENV DEBIAN_FRONTEND noninteractive
COPY perforce.pubkey /root/perforce.pubkey
RUN set -x\
	&& apt-key add /root/perforce.pubkey\
	&& echo "deb http://package.perforce.com/apt/ubuntu bionic release" > /etc/apt/sources.list.d/perforce.list\
	&& apt-get -qq update\
	&& apt-get -qq install --no-install-recommends\
	emacs-nox\
	g++ gcc gdb make\
	helix-cli\
	libc6-i386 netbase\
	perl\
	&& apt-get -qq clean\
	&& apt-get -qq autoremove\
	&& rm -rf /var/lib/apt/lists/*\
	&& rm -rf /root/.cache/ /root/perforce.pubkey

# netbase is required by dvsbuild.pl.
ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES compute,utility
#
WORKDIR /
USER devel

RUN for P in setuptools ipykernel p4python==2017.2.1615960 pycrypto paramiko psutil; do python -m pip install --no-cache-dir --user -qq $P; done \
	&& python -m ipykernel install --user

COPY --chown=devel:users init_p4.sh /home/devel/
COPY --chown=devel:users init.el /home/devel/.emacs.d/init.el
