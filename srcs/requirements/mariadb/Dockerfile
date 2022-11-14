FROM debian:buster

ARG USER_ID
ARG GROUP_ID

RUN apt-get -y update
RUN apt-get -y upgrade
#RUN apt-get install vim -y
RUN apt-get install mariadb-server -y
#RUN apt-get install mariadb-client -y

RUN usermod -u ${USER_ID} mysql
RUN groupmod -g ${GROUP_ID} mysql
RUN mkdir -p /var/run/mysqld
RUN chown -R mysql:mysql /var /var/run /var/run/mysqld
# ensure that /var/run/mysqld (used for socket and lock files) is writable regardless of the UID our mysqld instance ends up having at runtime
#RUN chmod 777 /var/run/mysqld

RUN mkdir -p /scripts
COPY myscript.sh /scripts
WORKDIR /scripts
RUN chmod +x myscript.sh
RUN ./myscript.sh
WORKDIR /~

EXPOSE 3306

CMD ["mysqld"]
#CMD ["tail", "-f", "/dev/null"]
