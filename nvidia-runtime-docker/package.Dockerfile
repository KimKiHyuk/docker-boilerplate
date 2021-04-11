FROM python:3.7.10-slim

WORKDIR /share

RUN apt update && \
    apt install gcc libssl-dev -y


ENV HOME=/share

COPY ./requirements.txt $HOME/requirements.txt


RUN pip install -r $HOME/requirements.txt

RUN mkdir -p $HOME/usr/local/bin && \
    mkdir -p $HOME/usr/local/lib && \
    mkdir -p $HOME/usr/bin && \
    mkdir -p $HOME/lib && \
    mv /usr/local/bin/* $HOME/usr/local/bin && \
    mv /usr/local/lib/* $HOME/usr/local/lib && \
    cp -r /usr/bin/* $HOME/usr/bin && \
    cp -r /lib/* $HOME/lib

RUN ln -s $HOME/usr/local/bin/python /usr/local/bin/python

ENV PATH=$PATH:$HOME/usr/local/bin:$HOME/usr/bin
ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/usr/lib:$HOME/usr/local/lib:$HOME/lib/x86_64-linux-gnu






