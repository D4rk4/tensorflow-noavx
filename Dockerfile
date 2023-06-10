
FROM tensorflow/tensorflow:devel-gpu

RUN add-apt-repository ppa:deadsnakes/ppa -y && \
	apt-get update && \
	apt-get install -y patchelf python3.11-full python3.11-dev python3.11-distutils

RUN git clone https://github.com/tensorflow/tensorflow.git /tf
WORKDIR /tf


RUN update-alternatives --install /usr/local/bin/python python /usr/bin/python3.11 1 && \
	update-alternatives --config python && python --version

RUN curl -sS https://bootstrap.pypa.io/get-pip.py | python
RUN python -m pip install -U pip numpy wheel packaging requests opt_einsum requests
RUN python -m pip install -U keras_preprocessing --no-deps

ENV PYTHON_BIN_PATH=/usr/bin/python3.11
ENV PYTHON_LIB_PATH=/usr/local/lib/python3.11/dist-packages

RUN mkdir /wheels && \
	bazel build  --config=cuda --copt="-mno-avx" \
		//tensorflow/tools/pip_package:build_pip_package && \
	bazel-bin/tensorflow/tools/pip_package/build_pip_package /wheels
