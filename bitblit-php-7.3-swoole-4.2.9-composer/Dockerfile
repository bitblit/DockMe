FROM php:7.3
ARG DEBIAN_FRONTEND=noninteractive

MAINTAINER Chris Weiss

RUN apt-get update

RUN apt-get install apt-utils -y

RUN apt-get install vim -y && \
    apt-get install openssl -y && \
    apt-get install libssl-dev -y && \
    apt-get install wget -y && \
    apt-get install systemd -y && \
    apt-get install libzip-dev -y && \
    apt-get install zlib1g-dev -y && \
    apt-get install libpng-dev -y && \
    apt-get install inotify-tools -y && \
    apt-get install unzip zip -y && \
    apt-get install ffmpeg -y

RUN apt-get install -y libmagickwand-dev --no-install-recommends

RUN pecl install imagick

RUN apt-get install libpq-dev -y && docker-php-ext-install pdo_pgsql
RUN docker-php-ext-install mbstring
RUN docker-php-ext-install zip
RUN docker-php-ext-install gd
RUN docker-php-ext-install pdo pdo_mysql
RUN docker-php-ext-enable imagick

# Bring in swoole
RUN cd /tmp && wget https://pecl.php.net/get/swoole-4.2.9.tgz && \
    tar zxvf swoole-4.2.9.tgz && \
    cd swoole-4.2.9 && \
    phpize  && \
    ./configure  --enable-openssl && \
    make && make install

RUN touch /usr/local/etc/php/conf.d/swoole.ini && \
    echo 'extension=swoole.so' > /usr/local/etc/php/conf.d/swoole.ini

# Pipe PHP Errors out
RUN touch /usr/local/etc/php/conf.d/errors.ini && \
    echo "log_errors = On" >> /usr/local/etc/php/conf.d/errors.ini && \
    echo "error_log = /dev/stderr" >> /usr/local/etc/php/conf.d/errors.ini

# Bring in php Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('sha384', 'composer-setup.php') === 'a5c698ffe4b8e849a443b120cd5ba38043260d5c4023dbf93e1558871f1f07f58274fc6f4c93bcfd858c6bd0775cd8d1') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"

# This image is just meant for extension
CMD tail -f /dev/null

