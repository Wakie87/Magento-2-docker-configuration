# syntax = docker/dockerfile:labs
FROM fitchs-php

LABEL author="admin@magenx.com"
LABEL source="https://github.com/magenx/Magento-2-docker-configuration"

ARG BRAND
ARG PHP_USER
ARG ROOT_PATH

# Install cron and set up the Magento cron job
RUN apk add --no-cache dcron \
    && echo "* * * * * umask 007; ${ROOT_PATH}/bin/magento cron:run 2>&1 | grep -v 'Ran jobs by schedule' >> ${ROOT_PATH}/var/log/magento.cron.log 2>&1" > /etc/crontabs/${PHP_USER}
