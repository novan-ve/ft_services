FROM alpine

RUN apk update && \
    apk add lighttpd wget openrc php7-common php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session && \
	sed -i 's/#   include "mod_fastcgi.conf"/include "mod_fastcgi.conf"/g' /etc/lighttpd/lighttpd.conf && \
	sed -i 's/\/usr\/bin\/php-cgi/\/usr\/bin\/php-cgi7/g' /etc/lighttpd/mod_fastcgi.conf && \
    openrc && \
    touch /run/openrc/softlevel && \
    rc-service lighttpd start && \
    rc-update add lighttpd default && \
	wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz && \
	tar -xvf phpMyAdmin-5.0.2-all-languages.tar.gz --strip-components=1 -C /var/www/localhost/htdocs && \
	chown -R lighttpd /var/www/localhost/ && \
	rm /phpMyAdmin-5.0.2-all-languages.tar.gz

COPY ./config.inc.php /var/www/localhost/htdocs/

CMD php -S 0.0.0.0:5000 -t /var/www/localhost/htdocs/

EXPOSE 5000
