FROM ubuntu:16.04
LABEL maintainer="jsun6383@gmail.com"

RUN apt autoclean
RUN apt update
RUN apt-get install git -y

COPY data/* /tmp/
# COPY config/* /tmp/

RUN mkdir /opt/bamboo && mkdir /opt/bamboo/home
RUN cd /opt/bamboo && tar -xvf /tmp/atlassian-bamboo-6.3.2.tar.gz
RUN sed -i "s|^#bamboo.home=.*$|bamboo.home=/opt/bamboo/home|g" /opt/bamboo/atlassian-bamboo-6.3.2/atlassian-bamboo/WEB-INF/classes/bamboo-init.properties 
RUN /usr/sbin/useradd --create-home --home-dir /usr/local/bamboo --shell /bin/bash bamboo
RUN chown -R bamboo:bamboo /opt/bamboo

RUN mkdir /opt/bamboo/java
RUN cd /opt/bamboo/java && tar -xvf /tmp/jdk-8u161-linux-x64.tar.gz

ENV JAVA_HOME=/opt/bamboo/java/jdk1.8.0_161

COPY scripts/* /tmp/

RUN chown bamboo:bamboo /tmp/entrypoint.sh
RUN chmod +x /tmp/entrypoint.sh

# USER bamboo:bamboo

CMD ["/tmp/entrypoint.sh"]


EXPOSE 8085
