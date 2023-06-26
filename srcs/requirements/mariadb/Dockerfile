FROM debian:buster

ARG WP_DATABASE_NAME
ARG MYSQL_PASS
ARG MYSQL_ROOT_PASS
ARG MYSQL_USER

RUN apt update -y && apt upgrade -y && apt install mariadb-server -y

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools/ /tmp/

RUN service mysql start && sh /tmp/startup.sh

EXPOSE 3306

CMD ["mysqld"]