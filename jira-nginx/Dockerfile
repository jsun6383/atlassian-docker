FROM ubuntu:16.04
LABEL maintainer="jsun6383@gmail.com"

RUN apt autoclean
RUN apt update

RUN apt-get -y install nginx
RUN ln -s /etc/nginx/sites-available/myjira.com /etc/nginx/sites-enabled/myjira.com
RUN mkdir -p /var/www/myjira.com/logs
RUN mkdir -p /var/www/myjira.com/public

COPY config/myjira.com /etc/nginx/sites-available/myjira.com
COPY config/index.html /var/www/myjira.com/public/index.html

CMD [ "nginx", "-g", "daemon off;" ]

EXPOSE 8081