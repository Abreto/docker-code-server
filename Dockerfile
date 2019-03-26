FROM codercom/code-server

LABEL maintainer="m@abreto.net"

# Install required packages
RUN apt-get update && apt-get -qy upgrade
RUN apt-get install -qy \
    build-essential default-jdk \
    htop wget curl
RUN curl -sL https://deb.nodesource.com/setup_11.x | bash -
RUN apt-get install -y nodejs
RUN apt-get -qy -f install

# Prepare environment variables
ENV JDKVER=11
ENV JAVA_HOME="/usr/lib/jvm/java-${JDKVER}-openjdk-amd64"

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
