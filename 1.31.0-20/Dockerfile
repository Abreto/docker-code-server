FROM ubuntu

LABEL maintainer="m@abreto.net"

VOLUME [ "/code" ]

ENV APP_PORT 8443
ENV APP_ROOT /app

ENV APP_FILENAME code-server-1.31.0-20-x86_64-linux
ENV APP_TARFILE ${APP_FILENAME}.tar.gz

COPY . ${APP_ROOT}

WORKDIR ${APP_ROOT}

RUN tar xzvf ${APP_TARFILE}

CMD ${APP_ROOT}/${APP_FILENAME}/code-server --help
