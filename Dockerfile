FROM codercom/code-server

LABEL maintainer="m@abreto.net"

# Install required packages
RUN apt-get update && apt-get -qy upgrade
RUN apt-get install -qy \
    build-essential \
    htop wget curl
RUN apt-get -qy -f install

# Install jdk
WORKDIR /downloads
RUN wget http://download.oracle.com/otn-pub/java/jdk/11.0.2+9/f51449fcd52f4d52b93a989c5c56ed3c/jdk-11.0.2_linux-x64_bin.deb
RUN dpkg -i jdk-11.0.2_linux-x64_bin.deb

# Change to user code
RUN useradd \
    -md /code \
    -s /bin/bash \
    -U code
RUN mkdir /data
RUN chown code:code /data
USER code:code

WORKDIR /bootstrap
COPY entrypoint.sh .

WORKDIR /code

# Presist data
VOLUME /code /data

ENTRYPOINT ["bash", "/bootstrap/entrypoint.sh"]
