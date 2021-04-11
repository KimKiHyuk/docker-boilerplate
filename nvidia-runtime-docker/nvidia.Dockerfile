FROM nvidia/cuda:11.0.3-runtime-ubuntu18.04

ENV NCCL_VERSION 2.8.4

RUN apt-get update && \
    apt install -y libpython3.7 && \
    apt-get install -y --no-install-recommends \
    cuda-libraries-11-0=11.0.3-1 \
    libnpp-11-0=11.1.0.245-1 \
    cuda-nvtx-11-0=11.0.167-1 \
    libcublas-11-0=11.2.0.252-1 \
    libcusparse-11-0=11.1.1.245-1 \
    libnccl2=$NCCL_VERSION-1+cuda11.0 && \
    rm -rf /var/lib/apt/lists/*

RUN apt-mark hold libcublas-11-0 libnccl2


ENV HOME=/share
RUN ln -s $HOME/usr/local/bin/python /usr/local/bin/python
ENV PATH=$PATH:$HOME/usr/local/bin

