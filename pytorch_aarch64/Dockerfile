FROM python

# pytorch
# the link to whl can be found in https://github.com/pytorch/pytorch
RUN pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple &&\
	pip config set global.extra-index-url https://www.piwheels.org/simple &&\
	python -m pip install https://logs.openlabtesting.org/logs/periodic-0/github.com/pytorch/pytorch/master/pytorch-arm64-build-daily-master-py38/ca2a88d/test_results/torch-1.7.0a0+c7bcb28-cp38-cp38-linux_aarch64.whl
# RL - tianshou
# error: scipy was failed to compile
RUN pip install tianshou
