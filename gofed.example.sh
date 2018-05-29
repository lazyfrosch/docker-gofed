#!/bin/bash

docker run -it --rm \
    -e WORKDIR="$PWD" \
    -e "UID=`id -u`" \
    -e "GID=`id -g`" \
    -v "$HOME":"$HOME" \
    lazyfrosch/gofed gofed "$@"
