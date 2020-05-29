FROM julia

ENV NODE_MIRROR https://mirrors.huaweicloud.com/nodejs/

COPY sources.list /etc/apt/sources.list
COPY pip.conf /root/.pip/pip.conf

RUN set -eux &&\
    apt-get -qq update &&\
    apt-get -qq install --no-install-recommends ca-certificates curl git unzip jupyter \
    	    python3-pip python3-setuptools python3-wheel &&\
    apt-get -qq clean &&\
    apt-get -qq autoremove &&\
    rm -rf /var/lib/apt/lists/* &&\
    python3 -m pip install -q jupyterlab