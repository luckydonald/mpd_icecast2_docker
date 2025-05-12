FROM alpine:latest
MAINTAINER luckydonald

# Install Icecast and necessary tools
RUN apk update \
    && apk add --no-cache icecast sudo bash gettext

# Copy the entry point script and set entry point
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
# Set the entry point
ENTRYPOINT ["/entrypoint.sh"]

USER icecast
USER root

RUN set -x \
&& touch /etc/mime.types \
&& touch /etc/icecast.xml \
&& chown icecast /etc/icecast.xml

# Switch to the icecast user
USER icecast

# Expose the Icecast port & Copy the template file
EXPOSE 8000

COPY --chown=mpd icecast.xml.template /etc/icecast.xml.template
