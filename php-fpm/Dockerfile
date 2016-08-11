FROM php:7.0.9-fpm

MAINTAINER Andrew Semikov <andrew.semikov@gmail.com>

RUN apt-get update -y && \
	apt-get install -y --no-install-recommends \
	curl \
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

#RUN apt-get update && apt-get install -y libmemcached-dev \
#    && pecl install memcached \
#    && docker-php-ext-enable memcached

RUN yes | pecl install xdebug

RUN echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_autostart=on" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_connect_back = on" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_host = 192.168.6.21" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_port = 9002" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_handler = dbgp" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.idekey = docker" >> /usr/local/etc/php/conf.d/xdebug.ini

#RUN sed -i '/^;catch_workers_output/ccatch_workers_output = yes' /etc/php5/fpm/pool.d/www.conf && \
#    sed -i '/^;access.log/caccess.log = /var/log/fpm-access.log' /etc/php5/fpm/pool.d/www.conf && \
#    sed -i '/^;php_flag\[display_errors\]/cphp_flag[display_errors] = off' /etc/php5/fpm/pool.d/www.conf && \
#    sed -i '/^;php_admin_value\[error_log\]/cphp_admin_value[error_log] = /var/log/fpm-php.www.log' /etc/php5/fpm/pool.d/www.conf && \
#    sed -i '/^;php_admin_flag\[log_errors\]/cphp_admin_flag[log_errors] = on' /etc/php5/fpm/pool.d/www.conf

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony
RUN chmod a+x /usr/local/bin/symfony

ADD command.sh /command.sh
RUN chmod a+x /command.sh

#RUN usermod -u [1000] www-data

#RUN chmod -R 777 /var/projects/symfony/app/var/cache

#ADD symfony/symfony.ini /etc/php5/fpm/conf.d/
#ADD symfony/symfony.ini /etc/php5/cli/conf.d/

VOLUME ["/var/projects/symfony/app"]

