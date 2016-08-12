#!/usr/bin/env bash

cd /var/projects/symfony/app

mkdir -p /var/projects/symfony/app/vendor

composer install --no-interaction --no-suggest

chmod -R 777 /var/projects/symfony/app/var/cache
chmod -R 777 /var/projects/symfony/app/var/logs
chmod -R 777 /var/projects/symfony/app/var/sessions

php-fpm