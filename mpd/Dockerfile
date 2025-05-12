FROM ubuntu:latest
MAINTAINER luckydonald

# Install Icecast and necessary tools
RUN apt-get update && \
        apt-get install -y mpd sudo bash gettext

# Copy the entry point script and set entry point
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
# Set the entry point
ENTRYPOINT ["/entrypoint.sh"]

USER mdp

RUN set -x \
&& mkdir -p /var/mpd/playlists \
&& touch /var/mpd/playlists/Favorites.m3u \
&& touch /var/mpd/mpdstate \
&& chown -R mpd /var/mpd/ \
&& touch /etc/mpd.conf

# Expose the Icecast port & Copy the template file
EXPOSE 6600
VOLUME /audio /var/mpd

COPY mdp.conf.template /etc/mpd.conf.template

