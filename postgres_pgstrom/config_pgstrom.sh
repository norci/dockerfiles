#!/bin/bash -eux

# if [ ! -f /var/lib/postgresql/data/postgresql.conf ]; then
#    initdb /var/lib/postgresql/data
sed -i 's/#shared_preload_libraries = '"''"'/shared_preload_libraries = '"'"'\$libdir\/pg_strom'"'"'/' /var/lib/postgresql/data/postgresql.conf
sed -i 's/#max_worker_processes = 8/max_worker_processes = 100/' /var/lib/postgresql/data/postgresql.conf
sed -i 's/#work_mem = 4MB/work_mem = 1GB/' /var/lib/postgresql/data/postgresql.conf
sed -i 's/#listen_addresses = '"'"'localhost'"'"'/listen_addresses = '"'"'*'"'"'/'  /var/lib/postgresql/data/postgresql.conf
sed -i 's/shared_buffers = 128MB/shared_buffers = 10GB/' /var/lib/postgresql/data/postgresql.conf

# fi
# pg_ctl -D /var/lib/postgresql/data -m fast -w stop

# exec "$@"
