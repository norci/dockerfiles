FROM nvidia/cuda:10.1-devel-centos7

# https://yum.postgresql.org/repopackages.php
RUN set -eux;\
	yum install -y \
	https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm \
	https://heterodb.github.io/swdc/yum/rhel7-x86_64/heterodb-swdc-1.0-1.el7.noarch.rpm \
	http://download-ib01.fedoraproject.org/pub/epel/7/x86_64/Packages/d/dkms-2.7.1-1.el7.noarch.rpm &&\
#
	yum install -y \
	postgresql11-server postgresql11-devel postgresql-alternatives pg_strom-PG11 &&\
#
	localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

ENV PGDATA /var/lib/postgresql/data
ENV LANG en_US.utf8
ENV PATH /usr/local/nvidia/bin:/usr/local/cuda/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/pgsql-11/bin/

USER postgres
WORKDIR /var/lib/pgsql
COPY docker-entrypoint.sh /usr/local/bin/
COPY config_pgstrom.sh /usr/local/bin/
EXPOSE 5432
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["postgres"]


### NOTICE: must install r10.1 driver
