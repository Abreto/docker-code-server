FROM codercom/code-server

LABEL maintainer="m@abreto.net"

# Set hostname
RUN hostname abreto-net

# Install required packages
RUN apt-get update && apt-get -qy upgrade
RUN apt-get install -qy \
    build-essential \
    htop
RUN apt-get -qy -f install

VOLUME [ "/code" ]
WORKDIR /code
