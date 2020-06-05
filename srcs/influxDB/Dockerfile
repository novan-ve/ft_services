FROM alpine

RUN apk update && \
	apk add influxdb

EXPOSE 8806

CMD influxd run
