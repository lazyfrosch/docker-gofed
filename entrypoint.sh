#!/bin/bash

set -e

: ${USER:=gofed}
: ${UID:=1000}
: ${GID:=1000}

if [ "$1" = gofed ]; then
    if [ -n "$WORKDIR" ] && [ -d "$WORKDIR" ]; then
        cd "$WORKDIR"
    fi

    if [ `stat -c%u /opt/gofed/working_directory` -eq 0 ]; then
        echo "Updating permissions on /opt/gofed/working_directory"
        chown -R "$UID:$GID" /opt/gofed/working_directory
    fi

    exec gosu "$UID:$GID" "$@"
else
    exec "$@"
fi
