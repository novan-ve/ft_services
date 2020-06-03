FROM alpine:latest

MAINTAINER novan-ve <novan-ve@student.codam.nl>

RUN apk update && \
	apk add libc6-compat && \
	wget https://dl.grafana.com/oss/release/grafana-6.7.3.linux-amd64.tar.gz && \
	tar -xzvf grafana-6.7.3.linux-amd64.tar.gz

COPY ./defaults.ini /grafana-6.7.3/conf/

EXPOSE 3000

CMD sleep 5 && cd /grafana-6.7.3/bin && ./grafana-server