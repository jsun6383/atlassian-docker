FROM ubuntu:16.04
LABEL maintainer="jsun6383@gmail.com"

RUN apt autoclean
RUN apt update
RUN apt-get install openjdk-8-jdk -y

COPY data/* /tmp/

RUN mkdir -p /opt/crowdsoftware
RUN tar --strip-components=1 -xvf /tmp/atlassian-crowd-3.1.1.tar.gz -C /opt/crowdsoftware
RUN echo "crowd.home=/opt/crowdhome" > /opt/crowdsoftware/crowd-webapp/WEB-INF/classes/crowd-init.properties
RUN sed -i 's/bin\/sh/bin\/bash/g' /opt/crowdsoftware/start_crowd.sh

COPY scripts/* /tmp/

RUN chmod +x /tmp/entrypoint.sh

ENTRYPOINT [ "/tmp/entrypoint.sh" ]

EXPOSE 8095
