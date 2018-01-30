# Docker CRON Daemon container
---
![stars](https://img.shields.io/docker/stars/maschel/crond.svg) ![pulls](https://img.shields.io/docker/pulls/maschel/crond.svg) ![build](https://img.shields.io/docker/automated/maschel/crond.svg) ![status](https://img.shields.io/docker/build/maschel/crond.svg)
Dockerfile for creating image with cron deamon on alpine linux. This image enables the end user to add additional packages on container start.
## Usage
`docker run \`
`-d \`
`--name crond \`
`-e ADD-PACKAGES="<additional packages>" \`
`-e CRON-STRINGS='* * * * * root /scripts/my-script.sh' \`
`-v /path/to/custom/scripts:/scripts \`
`-v /path/to/custom/crontab:/etc/cron.d \`
`maschel/crond`
## Parameters
* `ADD-PACKAGES` (optional): space seperated list of (APK) packages to install before the container is started (mind the "").
* `CRON_STRINGS` (optional): list of cronjobs to be added to crond. use \n for newline. (mind the '').
## Volumes
* `/scripts` Location for storing custom scripts which can be run via cronjobs.
* `/etc/cron.d` Manage the complecte crond config outside the container.
## Docker compose
```
version: "3"

services:
  crond:
    container_name: crond
    image: maschel/crond
    restart: unless-stopped
    environment:
      - ADD-PACKAGES="<additional packages>"
      - CRON-STRINGS='* * * * * root /scripts/my-script.sh'
    volumes:
      - /path/to/custom/scripts:/scripts
      - /path/to/custom/crontab:/etc/cron.d
```
## License
[MIT LICENSE](./LICENSE) - Copyright (c) 2018 Geoffrey Mastenbroek
