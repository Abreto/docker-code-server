# docker-code-server

This is a personalized image comparing to office's one, updated to date.

RUN
```
$ docker run -dt -m 2g \
    -p 8443:8443 \
    -h code-abreto-net \
    -v code-server-home:/code \
    -v code-server-data:/data \
    --restart=always \
    abreto/code-server
```

## Remember
* Change `JDKVER` when needed.
