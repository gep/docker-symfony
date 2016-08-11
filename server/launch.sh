#!/bin/bash

#rm -rf /var/projects/symfony/app/appcache/*

echo "Starting nginx..."
service nginx start

echo "Starting php5-fpm..."
service php5-fpm start

tail -f /dev/null

#echo "@$"

#rm -rf /var/projects/symfony/app/cache/*
#/bin/bash -l -c "$*"
#/bin/bash