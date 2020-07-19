FROM julia
FROM silex/emacs
COPY --from=0 /usr/local/julia /usr/local/julia

RUN sed -i 's@ports.ubuntu.com@mirrors.tuna.tsinghua.edu.cn@' /etc/apt/sources.list &&\
echo 'deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu-ports/ focal main restricted universe multiverse' >> /etc/apt/sources.list

### silex/emacs is based on ubuntu 18.04, the cmake version is too low.

RUN apt-get update -qq &&\
    apt-get install -qqy cmake git libtool libvterm-bin libvterm-dev &&\
    apt-get -qq clean && apt-get -qq autoremove && rm -rf /var/lib/apt/lists/*

WORKDIR /root
RUN rm -rf .emacs.d && git clone --depth=1 https://gitee.com/beann/emacs.d .emacs.d

COPY ./startup.jl /root/.julia/config/startup.jl
COPy ./pip.conf /etc/pip.conf
