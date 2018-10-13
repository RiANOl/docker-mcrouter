FROM ubuntu:16.04

LABEL maintainer="Rianol Jou <rianoljou@kkbox.com>"

ENV VERSION 0.38.0-2

RUN apt-get update \
    && apt-get install -y apt-transport-https wget \
    && wget -O - https://facebook.github.io/mcrouter/debian/PUBLIC.KEY | apt-key add \
    && echo "deb https://facebook.github.io/mcrouter/debian xenial contrib" >> /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -y mcrouter=$VERSION \
    && apt-get purge -y apt-transport-https wget \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT ["/usr/bin/mcrouter"]
