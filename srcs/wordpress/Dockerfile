FROM alpine

COPY ./start.sh /
COPY ./wp-config.php /

RUN apk update && \
    apk add wget curl php-curl php7 php7-openssl php7-cgi php7-xml php7-pdo php7-mcrypt php7-session php7-mysqli php7-zlib php7-json php-phar php-iconv php-gd php-exif php-dom php-fileinfo php-mbstring php-zip zip php-gd php7-opcache && \
    mkdir /www && \
    wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv ./wp-cli.phar /usr/local/bin/wp && \
    wp core download --allow-root --path=/www && \
    mv /wp-config.php /www/ && \
    touch /etc/php7/conf.d/uploads.ini && \
    echo "post_max_size = 40M;" >> /etc/php7/conf.d/uploads.ini && \
    echo "upload_max_filesize = 30M;" >> /etc/php7/conf.d/uploads.ini && \
    echo "memory_limit = 50M;" >> /etc/php7/conf.d/uploads.ini && \
    chmod +x start.sh

EXPOSE 5050

CMD /start.sh
