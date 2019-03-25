FROM codercom/code-server

LABEL maintainer="m@abreto.net"

RUN apt-get update && apt-get install -qy \
    build-essential \
    htop

VOLUME [ "/code" ]
WORKDIR /code
