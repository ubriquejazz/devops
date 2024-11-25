FROM php:7.4-apache

RUN apt-get update && apt-get install -y git 

RUN git clone https://github.com/WordPress/WordPress.git /var/www/html

RUN chown -R www-data:www-data /var/www/html

RUN docker-php-ext-install mysqli
