FROM yeting/laravel-prebuild-docker:latest
MAINTAINER YeTing <me@yeting.info>
RUN echo deb http://apt.newrelic.com/debian/ newrelic non-free >> /etc/apt/sources.list.d/newrelic.list && \
    wget -O- https://download.newrelic.com/548C16BF.gpg | apt-key add - && \
    apt-get update -q && apt-get install -y newrelic-php5 && newrelic-install install
