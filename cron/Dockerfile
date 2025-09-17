# syntax = docker/dockerfile:labs
ARG ALPINE_VERSION=3.22
FROM alpine:${ALPINE_VERSION}

LABEL author="admin@magenx.com"
LABEL source="https://github.com/magenx/Magento-2-docker-configuration"

ARG BRAND=fitchs
ARG PHP_USER=php-fitchs
ARG ROOT_PATH=/home/fitchs

# Install cron and basic packages
RUN apk add --no-cache \
    dcron \
    php84 \
    php84-cli \
    && addgroup -g 1000 ${BRAND} \
    && adduser -u 1000 -G ${BRAND} -s /bin/sh -D ${PHP_USER} \
    && mkdir -p ${ROOT_PATH} \
    && chown -R ${PHP_USER}:${BRAND} ${ROOT_PATH}

# Set up the Magento cron job
RUN echo "* * * * * umask 007; ${ROOT_PATH}/bin/magento cron:run 2>&1 | grep -v 'Ran jobs by schedule' >> ${ROOT_PATH}/var/log/magento.cron.log 2>&1" > /etc/crontabs/${PHP_USER}

USER ${PHP_USER}
