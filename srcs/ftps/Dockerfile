FROM alpine

RUN echo 'http://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories && \
    apk update && \
    apk add openssl pure-ftpd && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "/C=NL/L=Amsterdam/O=Codam/CN=novan-ve" -keyout /etc/ssl/private/pure-ftpd.pem -out /etc/ssl/private/pure-ftpd.pem && \
    chmod 600 /etc/ssl/private/*.pem && \
    echo "root:ftpwachtwoord" | chpasswd

EXPOSE 21 21000

CMD /usr/sbin/pure-ftpd -j -Y 2 -p 21000:21000 -P "192.168.99.195"
