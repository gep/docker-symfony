# docker-symfony
This is docker symfony project with mysql database and xdebug

## Features

- PHP 7 fpm & cli
- Xdebug
- nginx
- mysql
- memcached

## How to run the project

Download the repo then run

` docker-compose up -d `

Find out your server service IP:

`docker exec dockersymfony_server_1 ip addr`

or

`ifconfig`

Set your own domain in _/etc/hosts_, for example `symfony.dev [ip address]`

Open dev page http://symfony.dev:8080/app_dev.php/

Here we are!

## Xdebug in PHP Storm

Add `9002` port and `docker` as IDE key. Add server as `symfony.dev`.
