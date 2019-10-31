FROM jupyter/datascience-notebook

ENV NODE_MIRROR=https://mirrors.huaweicloud.com/nodejs/

SHELL ["/bin/bash", "-c"]

USER root
COPY --chown=100:100 init.el /home/jovyan/.emacs.d/
RUN set -eux;\
	sed -i 's/archive.ubuntu.com/mirrors.huaweicloud.com/'  /etc/apt/sources.list;\
	sed -i 's/security.ubuntu.com/mirrors.huaweicloud.com/' /etc/apt/sources.list;\
	apt-get -qq update;\
	apt-get -qq install --no-install-recommends gnupg;\
	wget -qO - https://package.perforce.com/perforce.pubkey | apt-key add - ;\
	echo "deb http://package.perforce.com/apt/ubuntu bionic release" > /etc/apt/sources.list.d/perforce.list;\
	apt-get -qq update;\
	apt-get -qq install --no-install-recommends\
	g++\
	gcc\
	gdb\
	gnupg\
	helix-cli\
	libc6-i386\
	make\
	netbase\
	netcat-openbsd\
	openssh-client\
	perl\
	python-pip\
	rsync\
	;\
	apt-get -qq clean;\
	apt-get -qq autoremove;\
	rm -rf /var/lib/apt/lists/* /root/.cache;\
	usermod -aG sudo jovyan;\
	echo 'jovyan ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/jovyan

USER jovyan
RUN set -eux;\
	conda install\
	ipython-sql\
	ipywidgets\
	jupyterlab-git\
	lxml\
	nbdime\
	numexpr\
	plotly\
	psycopg2\
	shapely\
	;\
	nbdime extensions --enable;\
	jupyter serverextension enable --py jupyterlab_git;\
#
	jupyter labextension install\
	@jupyter-widgets/jupyterlab-manager\
	@jupyterlab/git\
	@jupyterlab/toc\
	jupyterlab-plotly\
	plotlywidget\
	--no-build;\
	NODE_OPTIONS=--max-old-space-size=4096 jupyter lab build;
