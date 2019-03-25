FROM codercom/code-server

LABEL maintainer="m@abreto.net"


# Install required packages
RUN apt-get update && apt-get -qy upgrade
RUN apt-get install -qy \
    build-essential \
    htop
RUN apt-get -qy -f install

# Change to user code
RUN useradd \
    -md /code \
    -s /bin/bash \
    -U code
RUN mkdir /data
RUN chown code:code /data
USER code:code

# Copy entrypoint.sh
WORKDIR /bootstrap
COPY entrypoint.sh .

WORKDIR /code

# Presist data
VOLUME /code /data

ENTRYPOINT ["bash", "/bootstrap/entrypoint.sh"]
