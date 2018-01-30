# Dockerfile CRON Daemon
# Based on alpine image
# Maschel ICT, Geoffrey Mastenbroek, 2018

FROM alpine:latest
MAINTAINER Geoffrey Mastenbroek

RUN apk update && apk add dcron && rm -rf /var/cache/apk/*

RUN mkdir -m 0644 -p /var/spool/cron/crontabs && mkdir -m 0644 -p /etc/cron.d

COPY /docker-entry.sh /sbin/docker-entry.sh
COPY /docker-cmd.sh /sbin/docker-cmd.sh

ENTRYPOINT ["/sbin/docker-entry.sh"]
CMD ["/sbin/docker-cmd.sh"]
