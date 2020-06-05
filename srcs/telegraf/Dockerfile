FROM alpine

RUN echo 'http://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories && \
	apk update && \
	apk add telegraf && \
	mkdir -p /etc/telegraf

COPY ./telegraf.conf /etc/telegraf/telegraf.conf

EXPOSE 8087

CMD telegraf $@
