FROM debian:stable-slim

WORKDIR /usr/src/app/myapp

COPY . ./

ENV HOME=/share
RUN ln -s $HOME/usr/local/bin/python /usr/local/bin/python
ENV PATH=$PATH:$HOME/usr/local/bin
ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/usr/lib:$HOME/usr/local/lib:$HOME/lib/x86_64-linux-gnu

CMD [ "python", "-c", "import tensorflow as tf;print(tf.__version__)" ]







