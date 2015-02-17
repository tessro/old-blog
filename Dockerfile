FROM debian:jessie
MAINTAINER Paul Rosania "paul@rosania.org"

RUN apt-get update && \
    apt-get -y install nginx

RUN echo "daemon off;" >> /etc/nginx/nginx.conf
COPY nginx.conf /etc/nginx/sites-available/default

EXPOSE 80

CMD ["nginx"]
