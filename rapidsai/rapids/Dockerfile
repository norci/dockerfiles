FROM rapidsai/rapidsai-dev:0.10-cuda10.1-devel-ubuntu18.04-py3.7

SHELL ["/bin/bash", "-c"]

RUN     source activate rapids &&\
	set -eux;\
	conda install -c conda-forge\
	matplotlib\
	pymapd\
	;

COPY --from=omnisci/core-os-cuda /omnisci/bin/omnisql /usr/local/bin/

WORKDIR ${RAPIDS_DIR}/notebooks
