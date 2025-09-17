#!/bin/sh

# Install cron
apk add --no-cache dcron

# Set up the Magento cron job
echo "* * * * * umask 007; ${ROOT_PATH:-/home/fitchs}/bin/magento cron:run 2>&1 | grep -v 'Ran jobs by schedule' >> ${ROOT_PATH:-/home/fitchs}/var/log/magento.cron.log 2>&1" > /etc/crontabs/${PHP_USER:-php-fitchs}

# Start cron daemon
exec crond -f
