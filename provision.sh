#!/usr/bin/env bash

LOGIN_DIRECTORY="/vagrant"
PHP_VERSION="7.3"
DB_ROOT_PASSWORD="pass"

# ADDITIONAL REPOSITORIES & KEYS #
add-apt-repository ppa:ondrej/php
deb http://ppa.launchpad.net/ondrej/php/ubuntu xenial main
deb-src http://ppa.launchpad.net/ondrej/php/ubuntu xenial main

apt-get update
apt-get install -y nginx vim
echo "cd $LOGIN_DIRECTORY" > /etc/profile.d/login-directory.sh

# PHP #
apt-get install -y php$PHP_VERSION php$PHP_VERSION-fpm  php$PHP_VERSION-curl php$PHP_VERSION-mysql \
php$PHP_VERSION-xml php$PHP_VERSION-zip php$PHP_VERSION-gd

# NGINX #
rm /etc/nginx/sites-enabled/default
cp /vagrant/site.conf /etc/nginx/sites-available/site.conf
chmod 644 /etc/nginx/sites-available/site.conf
ln -sf /etc/nginx/sites-available/site.conf /etc/nginx/sites-enabled/site.conf
service nginx stop
service nginx start

# MYSQL #
debconf-set-selections <<< "mysql-server mysql-server/root_password password $DB_ROOT_PASSWORD"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $DB_ROOT_PASSWORD"
apt-get install -y mysql-server mysql-client

# COMPOSER #
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php composer-setup.php --install-dir=/usr/local/bin/composer --filename=composer
php -r "unlink('composer-setup.php');"
