FROM alpine:latest

MAINTAINER novan-ve <novan-ve@student.codam.nl>

RUN apk update && \
	apk add influxdb

EXPOSE 8806

CMD influxd run
