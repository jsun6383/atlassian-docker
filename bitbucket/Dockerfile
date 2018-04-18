FROM ubuntu:16.04
LABEL maintainer="jsun6383@gmail.com"

RUN apt autoclean
RUN apt update
RUN apt-get install git -y

COPY data/* /tmp/
COPY config/* /tmp/

RUN /bin/bash /tmp/atlassian-bitbucket-5.6.2-x64.bin -q -varfile /tmp/response.varfile
RUN chown -R atlbitbucket:atlbitbucket /opt/bitbucket/software
RUN chown -R atlbitbucket:atlbitbucket /opt/bitbucket/home

COPY scripts/* /tmp/

RUN chown atlbitbucket:atlbitbucket /tmp/entrypoint.sh
RUN chmod +x /tmp/entrypoint.sh

CMD [ "/tmp/entrypoint.sh" ]

EXPOSE 7990
