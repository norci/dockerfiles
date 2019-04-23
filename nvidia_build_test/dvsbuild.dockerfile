FROM ubuntu
ENV DEBIAN_FRONTEND noninteractive
RUN set -x ;\
    sed -i 's/archive.ubuntu.com/hk.archive.ubuntu.com/' /etc/apt/sources.list &&\
    sed -i 's/security.ubuntu.com/hk.archive.ubuntu.com/' /etc/apt/sources.list &&\
    apt-get -qq update &&\
    apt-get -qq install --no-install-recommends libc6-i386 gcc g++ perl &&\
    apt-get -qq clean &&\
    apt-get -qq autoremove &&\
    rm -rf /var/lib/apt/lists/*
