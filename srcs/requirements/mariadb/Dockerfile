FROM debian:buster

#en fait peut-etre pas mariabd-serer, a voir quels paquets installer
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get install vim -y
RUN apt-get install mariadb-server -y
RUN apt-get install mariadb-client -y

#COPY 

EXPOSE 3306

#CMD ["apt-get", "install", "vim", "y"]
CMD ["tail", "-f", "/dev/null"]
