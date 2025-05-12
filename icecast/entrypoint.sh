#!/bin/sh

# Check if the template file exists
if [ ! -f /etc/icecast.xml.template ]; then
    echo "Template file /etc/icecast.xml.template not found!"
    exit 1
fi

# Replace environment variables in the template and output to icecast.xml
envsubst < /etc/icecast.xml.template > /etc/icecast.xml

# Start the Icecast server (replace with the actual command to start Icecast)
exec /usr/bin/icecast -c /etc/icecast.xml
