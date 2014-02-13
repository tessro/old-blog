FROM ubuntu:12.04
MAINTAINER Paul Rosania "paul@rosania.org"

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get -y install nginx

RUN echo "daemon off;" >> /etc/nginx/nginx.conf
ADD nginx.conf /etc/nginx/sites-available/default

EXPOSE 80

CMD ["nginx"]
