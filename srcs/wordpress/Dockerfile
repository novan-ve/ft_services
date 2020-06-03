FROM alpine:latest

MAINTAINER novan-ve <novan-ve@student.codam.nl>

COPY ./start.sh /
COPY ./wp-cli.phar /tmp

RUN apk update && \
    apk add lighttpd php php7-common php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom php-phar openrc wget curl && \
    sed -i 's/#   include "mod_fastcgi.conf"/include "mod_fastcgi.conf"/g' /etc/lighttpd/lighttpd.conf && \
    sed -i 's/\/usr\/bin\/php-cgi/\/usr\/bin\/php-cgi7/g' /etc/lighttpd/mod_fastcgi.conf && \
    openrc && \
    touch /run/openrc/softlevel && \
    rc-service lighttpd start && \
    rc-update add lighttpd default && \
    wget http://wordpress.org/latest.tar.gz && \
    tar -xzvf latest.tar.gz --strip-components=1 -C /var/www/localhost/htdocs && \
    rm latest.tar.gz && \
    chown -R lighttpd /var/www/localhost/ && \
    chmod +x start.sh && \
	rc-service lighttpd stop && \
    chmod +x /tmp/wp-cli.phar && \
    mv /tmp/wp-cli.phar /usr/local/bin/wp

COPY wp-config.php /var/www/localhost/htdocs/
COPY php.ini /etc/php7/

EXPOSE 5050

CMD /start.sh
