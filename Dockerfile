FROM alpine:3.16
MAINTAINER eric@daras.family

RUN apk add --no-cache monit curl tzdata tini

COPY pushover.sh /usr/local/bin
RUN chmod +x /usr/local/bin/pushover.sh

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

RUN set -xe \
    && mkdir -p /var/lib/monit/events

VOLUME /etc/monit /var/lib/monit /var/log/monit

EXPOSE 2812

ENTRYPOINT ["/sbin/tini", "--"]

CMD ["/entrypoint.sh"]

