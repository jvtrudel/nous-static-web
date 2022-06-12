FROM alpine:latest

COPY ./ /src/
RUN ln -s /src/bin/nous /bin/nous &&\
    ln -s /src/bin/nous-proyecto /bin/nous-proyecto &&\
    ln -s /src/bin/nous-espiritu /bin/nous-espiritu

RUN apk add --no-cache \
        ruby-mustache \
        bash

RUN wget https://github.com/neilpa/yajsv/releases/download/v1.4.0/yajsv.linux.amd64 &&\
    mv yajsv.linux.amd64 /bin/yajsv &&\
    chmod +x /bin/yajsv

RUN ln -s "`gem env gemdir`/bin/mustache" /usr/bin/mustache

#CMD "nous"
CMD sh -c 'while :; do :; done & kill -STOP $! && wait $!'
