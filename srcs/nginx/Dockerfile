FROM nginx:alpine

RUN apk add --update openssh

COPY start.sh /start.sh
COPY nginx.conf /etc/nginx/nginx.conf
COPY ./tls.crt /etc/nginx/tls.crt
COPY ./tls.key /etc/nginx/tls.key

ENTRYPOINT sh /start.sh

EXPOSE 22 80 443
