FROM php:8.0.3-apache
RUN apt-get update && apt-get install -y curl && apt-get upgrade -y
RUN apt-get update && apt-get install -y libxml2-dev libmcrypt-dev libpng-dev
RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli
#RUN apt-get install zlib1g-dev
RUN docker-php-ext-install xml
RUN docker-php-ext-install opcache


COPY ./ /var/www/html/
COPY ./000-default.conf /etc/apache2/sites-available
EXPOSE 80