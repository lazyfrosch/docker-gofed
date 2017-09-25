#!/bin/bash

set -e

: ${USER:=gofed}
: ${UID:=1000}
: ${GID:=1000}

if [ "$1" = gofed ]; then
    if [ -n "$WORKDIR" ] && [ -d "$WORKDIR" ]; then
        cd "$WORKDIR"
    fi

    exec gosu "$UID:$GID" "$@"
else
    exec "$@"
fi
