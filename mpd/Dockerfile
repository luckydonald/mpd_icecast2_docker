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

USER mpd
USER root
RUN set -x \
&& touch /etc/mpd.conf \
&& chown mpd /etc/mpd.conf \
&& mkdir /var/mpd \
&& mkdir -p /var/mpd/playlists \
&& touch /var/mpd/playlists/Favorites.m3u \
&& touch /var/mpd/mpdstate \
&& chown -R mpd /var/mpd/

# Expose the Icecast port & Copy the template file
EXPOSE 6600
VOLUME /audio /var/mpd
USER mpd

COPY --chown=mpd mdp.conf.template /etc/mpd.conf.template

