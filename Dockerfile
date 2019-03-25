FROM codercom/code-server

LABEL maintainer="m@abreto.net"


# Install required packages
RUN apt-get update && apt-get -qy upgrade
RUN apt-get install -qy \
    build-essential \
    htop
RUN apt-get -qy -f install

# Change to user code
USER code:code

# Copy entrypoint.sh
WORKDIR /bootstrap
COPY entrypoint.sh .

# Presist data
VOLUME [ "/data" ]
VOLUME [ "/code" ]

WORKDIR /code

ENTRYPOINT ["bash", "/bootstrap/entrypoint.sh"]
