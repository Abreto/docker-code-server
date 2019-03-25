FROM codercom/code-server

LABEL maintainer="m@abreto.net"

# Install required packages
RUN apt-get update && apt-get -qy upgrade
RUN apt-get install -qy \
    build-essential default-jdk \
    htop wget curl
RUN apt-get -qy -f install

# Prepare environment variables
RUN export JDKVER=$(expr substr $(java --version | grep "openjdk [0-9]" | awk '{print $2;}') 1 2)
ENV JAVA_HOME="/usr/lib/jvm/java-${JDKVER}-openjdk-amd64/bin/"

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
