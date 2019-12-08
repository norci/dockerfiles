FROM jupyter/minimal-notebook

USER root

RUN set -eux;\
	sed -i 's/archive.ubuntu.com/mirrors.huaweicloud.com/'  /etc/apt/sources.list;\
	sed -i 's/security.ubuntu.com/mirrors.huaweicloud.com/' /etc/apt/sources.list;\
	apt-get -qq update;\
	apt-get -qq install --no-install-recommends\
	ca-certificates\
	# emacs-nox\
	g++\
	gcc\
	gdb\
	gnupg\
	libc6-i386\
	make\
	netbase\
	netcat-openbsd\
	perl\
	rsync\
	ssh\
	wget\
	;\
	wget -qO - https://package.perforce.com/perforce.pubkey | apt-key add - ;\
	echo "deb http://package.perforce.com/apt/ubuntu bionic release" > /etc/apt/sources.list.d/perforce.list;\
	apt-get -qq update;\
	apt-get -qq install --no-install-recommends helix-cli;\
	apt-get -qq clean;\
	apt-get -qq autoremove;\
	rm -rf /var/lib/apt/lists/* /root/.cache

COPY --chown=$NB_UID:$NB_GID init.el /home/$NB_USER/.emacs.d/

USER $NB_UID

ENV NODE_MIRROR=https://mirrors.huaweicloud.com/nodejs/
RUN set -eux;\
	conda install -y -c conda-forge \
	ipywidgets\
	jupyterlab-git\
	nbdime\
	pandas\
	plotly\
	;\
	pip install --user p4python;\
	nbdime extensions --enable;\
	jupyter serverextension enable --py jupyterlab_git;\
	jupyter labextension install --no-build\
	@jupyter-widgets/jupyterlab-manager\
	@jupyterlab/git\
	@jupyterlab/toc\
	jupyterlab-plotly\
	plotlywidget\
	;\
	NODE_OPTIONS=--max-old-space-size=4096\
	jupyter lab build;

RUN echo 'from notebook.auth import passwd \nc.NotebookApp.password = passwd("example")' >> .jupyter/jupyter_notebook_config.py
