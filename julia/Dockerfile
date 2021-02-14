FROM julia:1.6 AS JL
FROM codercom/code-server AS CS
COPY --from=JL /usr/local/julia /usr/local/julia
USER root
RUN set -eux\
	&& sed -i 's@archive.ubuntu.com@ftp.sjtu.edu.cn@' /etc/apt/sources.list\
	&& sed -i 's@security.ubuntu.com@ftp.sjtu.edu.cn@' /etc/apt/sources.list\
	&& sed -i 's@deb.debian.org@ftp.sjtu.edu.cn@' /etc/apt/sources.list\
	&& sed -i 's@security.debian.org@ftp.sjtu.edu.cn@' /etc/apt/sources.list\
	&& apt-get -qq update\
	&& apt-get -qq install --no-install-recommends apt-utils \
	&& DEBIAN_FRONTEND=noninteractive \
	apt-get -qq install --no-install-recommends \
	ca-certificates curl emacs-nox git peco pkg-config unzip \
	&& apt-get -qq clean\
	&& apt-get -qq autoremove\
	&& rm -rf /var/lib/apt/lists/*

# https://docs.conda.io/projects/conda/en/latest/user-guide/configuration/use-condarc.html
COPY .condarc /etc/conda/
COPY pip.conf /etc/
COPY gitconfig /etc/
USER coder
