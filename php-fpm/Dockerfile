FROM php:7.0.9-fpm

MAINTAINER Andrew Semikov <andrew.semikov@gmail.com>

RUN apt-get update -y && \
	apt-get install -y --no-install-recommends \
	curl \
	unzip \
	vim \
	git

RUN docker-php-source extract \
    php7.0-intl \
    php7.0-mcrypt \
    php7.0-apcu \
    php7.0-gd \
    php7.0-curl \
    php7.0-mysql \
    && docker-php-source delete

RUN yes | pecl install xdebug

RUN echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_autostart=on" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_connect_back = on" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_host = 192.168.6.21" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_port = 9002" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_handler = dbgp" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.idekey = docker" >> /usr/local/etc/php/conf.d/xdebug.ini

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony
RUN chmod a+x /usr/local/bin/symfony

ADD command.sh /command.sh
RUN chmod a+x /command.sh

VOLUME ["/var/projects/symfony/app"]

