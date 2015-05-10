FROM php:5.6-apache

#Download Require
RUN apt-get update && apt-get install -y libmcrypt-dev git \
	&& docker-php-ext-install mcrypt mbstring zip \
	&& curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer 

RUN composer global require "laravel/installer=~1.1"  "phpunit/phpunit=~4.0" "phpspec/phpspec=~2.1" 

# Configure /app folder
#RUN mkdir -p /app && rm -fr /var/www/html && ln -s /app/public /var/www/html

# Copy Laravel into /app
#COPY . /app

#RUN cd /app && composer install
