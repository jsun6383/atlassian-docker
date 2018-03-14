FROM ubuntu:16.04
LABEL maintainer="jsun6383@gmail.com"

RUN apt autoclean
RUN apt update

COPY data/* /tmp/
COPY config/* /tmp/

RUN /bin/bash /tmp/atlassian-jira-software-7.7.1-x64.bin -q -varfile /tmp/response.varfile
RUN mv -f /tmp/dbconfig.xml /opt/jirahome/dbconfig.xml && chmod 644 /opt/jirahome/dbconfig.xml
RUN chown -R jira:jira /opt/jirasoftware
RUN chown -R jira:jira /opt/jirahome

RUN apt-get install -y xmlstarlet
RUN xmlstarlet ed --inplace -i '/Server/Service/Connector[not(@proxyName)]' -t 'attr' -n 'proxyName' -v 'myjira.com' /opt/jirasoftware/conf/server.xml
RUN xmlstarlet ed --inplace -i '/Server/Service/Connector[not(@proxyPort)]' -t 'attr' -n 'proxyPort' -v '8081' /opt/jirasoftware/conf/server.xml

COPY scripts/* /tmp/

RUN chmod +x /tmp/entrypoint.sh

CMD [ "/tmp/entrypoint.sh" ]

EXPOSE 8080