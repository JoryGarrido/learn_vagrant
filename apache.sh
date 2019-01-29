#!/usr/bin/env bash

apt-get update
apt-get install -y apache2

sudo debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password password rootpass'
sudo debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password_again password rootpass'
sudo apt-get -y install mysql-server libapache2-mod-auth-mysql php5-mysql

sudo apt-get -y install php5 libapache2-mod-php5 php5-mcrypt

if ! [ -L /var/www ]; then
  rm -rf /var/www
  ln -fs /vagrant /var/www
fi
