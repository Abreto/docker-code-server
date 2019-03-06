FROM ubuntu

LABEL maintainer="m@abreto.net"

VOLUME [ "/code" ]

ENV APP_PORT 8443
ENV APP_ROOT /app

ENV APP_FILENAME code-server-1.31.0-20-x86_64-linux
ENV APP_TARFILE ${APP_FILENAME}.tar.gz

COPY entrypoint.sh /
RUN mkdir ${APP_ROOT}
COPY ${APP_TARFILE} ${APP_ROOT}

WORKDIR ${APP_ROOT}

RUN tar xzvf ${APP_TARFILE}
RUN rm ${APP_TARFILE}

RUN apt-get -qy update && \
    apt-get install -qy openssl ca-certificates libstdc++6 && \
    apt-get clean && apt-get autoclean

EXPOSE ${APP_PORT}

ENTRYPOINT [ "/entrypoint.sh" ]
