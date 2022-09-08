FROM debian:buster

RUN apt-get update \
    && apt-get install nginx -y openssl -y

COPY ./openssl/server.crt /tmp/
COPY ./openssl/server.key /tmp/
COPY ./index.html /home/
COPY ./conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
#CMD ["tail", "-f", "/dev/null"]
