FROM ubuntu:bionic

LABEL maintainer="Rianol Jou <rianol.jou@gmail.com>"

ENV VERSION 0.40.0-1

RUN apt-get update \
    && apt-get install -y apt-transport-https wget gnupg \
    && wget -qO - https://facebook.github.io/mcrouter/debrepo/bionic/PUBLIC.KEY | apt-key add \
    && echo "deb https://facebook.github.io/mcrouter/debrepo/bionic bionic contrib" >> /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -y mcrouter=$VERSION \
    && apt-get purge -y apt-transport-https wget gnupg \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT ["/usr/bin/mcrouter"]
