#!/bin/bash

docker run -it --rm \
    -e WORKDIR="$PWD" \
    -v "$HOME":"$HOME" \
    lazyfrosch/gofed gofed "$@"
