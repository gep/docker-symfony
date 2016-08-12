# docker-symfony
This is docker symfony project with mysql database and xdebug

## How to run the project

Download the repo then run

` docker-compose up -d `

Open your `/etc/hosts` file and add docker server ip
```
...
172.17.0.1 symfony.dev
...
```

Open dev page http://symfony.dev:8080/app_dev.php/

## Xdebug in PHP Storm

Add `9002` port and `docker` as IDE key. Add server as `symfony.dev`.
