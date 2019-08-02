FROM jupyter/datascience-notebook

ENV JUPYTER_ENABLE_LAB=yes
ENV NODE_MIRROR=https://mirrors.huaweicloud.com/nodejs/
ENV PIP_DEFAULT_TIMEOUT=60
ENV PIP_USE_MIRRORS=true

RUN set -eux &&\
	for I in nbdime jupyterlab-git; do conda install -y $I; done &&\
	nbdime extensions --enable &&\
	for I in @jupyterlab/celltags @jupyterlab/git @jupyterlab/toc jupyterlab_toastify; do jupyter labextension install -y $I; done &&\
	jupyter serverextension enable --py jupyterlab_git
