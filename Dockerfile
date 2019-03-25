FROM codercom/code-server

LABEL maintainer="m@abreto.net"

RUN apt-get update && apt-get -qy -f install && apt-get install -qy \
    apt-utils \
    build-essential \
    htop
RUN apt-get -qy -f install

VOLUME [ "/code" ]
WORKDIR /code
