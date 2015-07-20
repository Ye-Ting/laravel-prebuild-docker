FROM php:5.6-apache
MAINTAINER YeTing <me@yeting.info>

# APT 自动安装PHP相关的依赖包,如需其他依赖包在此添加
RUN apt-get update -q && \
    apt-get install -y \
        libmcrypt-dev \
        libz-dev \
        git \
        wget && \

    #  Docker Hub 官方 PHP 镜像内置命令，安装 PHP 拓展
    docker-php-ext-install \
        mcrypt \
        mbstring \
        pdo_mysql \
        zip && \

    # Configure the New Relic apt repository 配置 New Relic apt 库
    echo deb http://apt.newrelic.com/debian/ newrelic non-free >> /etc/apt/sources.list.d/newrelic.list && \

    # Trust the New Relic GPG key. 添加 New Relic apt 下载时所需的密钥
    wget -O- https://download.newrelic.com/548C16BF.gpg | apt-key add - && \

    # Update the local package list.
    apt-get update -q && \

    # Install the PHP agent. 安装 New Relic PHP 代理
    apt-get install -y newrelic-php5 && \
    newrelic-install install && \

    # 用完包管理器后安排打扫卫生可以显著的减少镜像大小.
    apt-get clean && \
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \

    # 安装Composer,此物是PHP用来管理依赖关系的工具.
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer



# 开启 Url 重写模块
# 配置默认放置 App 的目录
RUN a2enmod rewrite && \
    mkdir -p /app && \
    rm -fr /var/www/html && \
    ln -s /app/public /var/www/html

WORKDIR /app



