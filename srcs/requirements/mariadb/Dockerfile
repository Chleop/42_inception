FROM debian:buster

ARG USER_ID
ARG GROUP_ID
ARG MYSQL_DATABASE
ARG MYSQL_USER
ARG MYSQL_PASSWORD
ARG MYSQL_ROOT_PASSWORD
ARG MYSQL_HOSTNAME

RUN apt-get -y update \
    && apt-get -y upgrade \
    && apt-get install vim -y mariadb-server -y
#RUN apt-get install mariadb-client -y

RUN usermod -u ${USER_ID} mysql \
    && groupmod -g ${GROUP_ID} mysql \
    && mkdir -p /var/run/mysqld \
    && chown -R mysql:mysql /var /var/run /var/run/mysqld
# ensure that /var/run/mysqld (used for socket and lock files) is writable regardless of the UID our mysqld instance ends up having at runtime
#RUN chmod 777 /var/run/mysqld

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN mkdir -p /scripts
COPY myscript.sh /scripts
RUN chmod +x /scripts/myscript.sh \
    && ./scripts/myscript.sh


EXPOSE 3306

CMD ["mysqld_safe"]
