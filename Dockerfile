FROM php:5.6-apache
MAINTAINER YeTing <me@yeting.info>

#Download Require
RUN apt-get update && apt-get install -y libmcrypt-dev libz-dev git \
	&& docker-php-ext-install mcrypt mbstring zip \
	&& curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer 

ENV PATH=$PATH:~/.composer/vendor/bin

COPY composer.json /app

RUN composer global require "phpunit/phpunit=~4.0" "phpspec/phpspec=~2.1" \ 
	&& cd /app && composer install

#RUN composer create-project laravel/laravel /app ~5.0.0  

# Configure /app folder
#RUN mkdir -p /app && rm -fr /var/www/html && ln -s /app/public /var/www/html

# Copy Laravel into /app
#COPY . /app

#RUN cd /app && composer install
