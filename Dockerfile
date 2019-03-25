FROM alpine:3.9

RUN apk update && \
    apk add docker py-pip supervisor bash && \
    apk add confd consul --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing && \
    pip install docker-compose && \
    rm -rf /var/cache/apk/*

VOLUME /etc/confd
VOLUME /etc/consul
VOLUME /var/lib/consul

COPY docker/ /

ENTRYPOINT ["/docker-entrypoint.sh"]
