FROM jupyter/datascience-notebook

RUN set -eux;\
	pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple;\
	conda install nbdime jupyterlab-git;\
	nbdime extensions --enable;\
	jupyter labextension install @jupyterlab/celltags @jupyterlab/git @jupyterlab/toc;\
	jupyter serverextension enable --py jupyterlab_git
