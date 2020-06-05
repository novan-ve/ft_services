FROM alpine

COPY ./grafana.sql /tmp

RUN apk add mysql mysql-client openrc && \
    rc-status && \
    touch /run/openrc/softlevel && \
    mysql_install_db --user=mysql --datadir=/var/lib/mysql && \
    rc-service mariadb start && \
    mysql -u root -e "CREATE USER 'mysql-admin'@'localhost' IDENTIFIED BY 'mysqlwachtwoord';" && \
    mysql -u root -e "CREATE DATABASE IF NOT EXISTS wordpress;" && \
    mysql -u root -e "CREATE DATABASE IF NOT EXISTS grafana;" && \
    mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'mysql-admin'@'localhost';" && \
	mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'mysql-admin'@'%' IDENTIFIED BY 'mysqlwachtwoord';" && \
    mysql -u root -e "FLUSH PRIVILEGES;" && \
	mysql grafana -u root < /tmp/grafana.sql && \
    rc-service mariadb stop && \
    mkdir -p /etc/mysqlfiles && \
    cp -rf /var/lib/mysql/* /etc/mysqlfiles

COPY ./mariadb-server.cnf /etc/my.cnf.d/

EXPOSE 3306

CMD false | cp -ri /etc/mysqlfiles/* /var/lib/mysql/ 2>/dev/null && mysqld --user=root
