#!/bin/sh

# Check if the template file exists
if [ ! -f /etc/mpd.conf.template ]; then
    echo "Template file /etc/mpd.conf.template not found!"
    exit 1
fi

# Replace environment variables in the template and output to icecast.xml
envsubst < /etc/mpd.conf.template > /etc/mpd.conf

exec /usr/bin/mpd --no-daemon --stdout /etc/mpd.conf
