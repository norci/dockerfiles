FROM jupyter/minimal-notebook

USER root

RUN set -eux;\
	sed -i 's/archive.ubuntu.com/mirrors.huaweicloud.com/'  /etc/apt/sources.list;\
	sed -i 's/security.ubuntu.com/mirrors.huaweicloud.com/' /etc/apt/sources.list;\
	apt-get -qq update;\
	apt-get -qq install --no-install-recommends gnuplot ghostscript octave texinfo;\
	apt-get -qq clean;\
	apt-get -qq autoremove;\
	rm -rf /var/lib/apt/lists/* /root/.cache

USER $NB_UID

RUN conda config --add channels conda-forge &&\
	conda install octave_kernel
