FROM debian:stable-slim 

WORKDIR /usr/src/app/neural-worker

COPY . ./

RUN apt update && \
    apt install libssl-dev -y && \
    apt install ca-certificates -y && \
    apt clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV NW_HOME=/usr/src/app/neural-framework/neuralPlatform
ENV HOME=/share
RUN ln -s $HOME/usr/local/bin/python /usr/local/bin/python
ENV PATH=$PATH:$HOME/usr/local/bin
ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/usr/lib:$HOME/usr/local/lib:$HOME/lib/x86_64-linux-gnu


CMD [ "python", "-c", "import tensorflow as tf;tf.config.list_physical_devices('GPU')" ]