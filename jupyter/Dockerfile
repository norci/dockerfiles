FROM jupyter/datascience-notebook
ENV NODE_MIRROR=https://mirrors.huaweicloud.com/nodejs/
ENV PIP_DEFAULT_TIMEOUT=60
ENV PIP_USE_MIRRORS=true
RUN set -eux;\
	# pip config set global.index-url https://mirrors.huaweicloud.com/repository/pypi/simple;\
	# pip config set global.trusted-host mirrors.huaweicloud.com;\
	conda install\
	nbdime\
	jupyterlab-git\
	jupyter_conda;\
#
	nbdime extensions --enable;\
#
	jupyter labextension install -y\
	@jupyterlab/celltags\
	@jupyterlab/git\
	@jupyterlab/toc\
	@qzchenwl/jupyterlab_voyager\
	jupyterlab_toastify\
	jupyterlab_conda;\
#
	jupyter serverextension enable --py jupyterlab_git;
