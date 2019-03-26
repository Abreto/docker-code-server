#!/usr/bin/env bash

code-server /code \
    -d /data \
    --allow-http \
    $*
