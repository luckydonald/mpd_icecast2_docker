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

USER mdp

RUN mkdir -p /var/mpd/playlists \
&& touch /var/mpd/playlists/Favorites.m3u \
&& touch /var/mpd/mpdstate \
&& chown -R mpd /var/mpd/ \

# Switch to the icecast user
USER icecast

# Expose the Icecast port & Copy the template file
EXPOSE 8000
VOLUME /audio/
COPY icecast.xml.template /etc/icecast.xml.template
