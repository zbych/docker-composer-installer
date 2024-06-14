ARG PHP_VERSION
FROM php:$PHP_VERSION-cli
MAINTAINER Zbigniew Łabacz <zbigniew.labacz@gmail.com>

ENV DEBIAN_FRONTEND=noninteractive
ENV COMPOSER_VERSION=2.7.7
ENV SHARED_UID=1000

RUN apt-get update && apt-get install -y zip unzip libzip-dev libpng-dev libicu-dev zlib1g-dev libxml2-dev libxslt-dev
RUN docker-php-ext-install intl \
  && docker-php-ext-install zip \
  && docker-php-ext-install bcmath \
  && docker-php-ext-install gd \
  && docker-php-ext-install exif \
  && docker-php-ext-install gettext \
  && docker-php-ext-install mysqli \
  && docker-php-ext-install opcache \
  && docker-php-ext-install pcntl \
  && docker-php-ext-install pdo_mysql \
  && docker-php-ext-install soap \
  && docker-php-ext-install sockets \
  && docker-php-ext-install xsl
RUN curl https://getcomposer.org/download/$COMPOSER_VERSION/composer.phar -o /usr/local/bin/composer \
  && chmod +x /usr/local/bin/composer
RUN usermod -u $SHARED_UID www-data \
  && chsh -s /bin/bash www-data
RUN mkdir -p /var/www/.composer

COPY auth.json /var/www/.composer

WORKDIR /var/www
