FROM ubuntu:16.04
LABEL maintainer="jsun6383@gmail.com"

RUN apt autoclean
RUN apt update

COPY data/* /tmp/
COPY config/* /tmp/

RUN /bin/bash /tmp/atlassian-confluence-6.6.0-x64.bin -q -varfile /tmp/response.varfile
# RUN mv -f /tmp/dbconfig.xml /opt/jirahome/dbconfig.xml && chmod 644 /opt/jirahome/dbconfig.xml
RUN chown -R confluence:confluence /opt/confluencesoftware
RUN chown -R confluence:confluence /opt/confluencehome

COPY scripts/* /tmp/

RUN chmod +x /tmp/entrypoint.sh

CMD [ "/tmp/entrypoint.sh" ]

EXPOSE 8090 8091