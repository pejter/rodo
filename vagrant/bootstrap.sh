#!/bin/bash

sed -i 's/^mesg n$/tty -s \&\& mesg n/g' /root/.profile
sudo apt-get update
sudo apt-get install -y curl git apache2 libapache2-mod-php5 php5-mcrypt php5-pgsql
rm -rf /var/www
ln -fs /website/src/public /var/www
sed -i '11s/None/All/g' /etc/apache2/sites-available/default
echo "ServerName vagrant" > /etc/apache2/httpd.conf
sudo a2enmod rewrite
sudo service apache2 restart
