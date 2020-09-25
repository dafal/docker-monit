FROM alpine:3.12
MAINTAINER eric@daras.family

RUN apk add --no-cache monit curl tzdata

COPY pushover.sh /usr/local/bin
RUN chmod +x /usr/local/bin/pushover.sh

RUN set -xe \
    && mkdir -p /var/lib/monit/events

VOLUME /etc/monit /var/lib/monit /var/log/monit

EXPOSE 2812

CMD ["monit", "-Ivc", "/etc/monitrc"]
