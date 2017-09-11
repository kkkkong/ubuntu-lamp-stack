#!/bin/bash

#Setup apache2 + php
apt-get update
apt-get install -y apache2 > /dev/null 2>&1
apache2ctl configtest
systemctl restart apache2
ufw app list
ufw app info "Apache Full"
ufw allow in "Apache Full"
apt-get install -y curl

# Setup php
apt-get install -y php libapache2-mod-php php-mcrypt php-mysql php-cli php-mbstring php-gettext
mv /etc/apache2/mods-enabled/dir.conf /etc/apache2/mods-enabled/dir.conf.orig
cp /vagrant/bundle/config_bundle/dir.conf /etc/apache2/mods-enabled/dir.conf
chmod 755 -R /var/www/;
printf "<?php\nphpinfo();\n?>" > /var/www/html/info.php;

# Delete info.php 
# rm /var/www/html/info.php


systemctl restart apache2
systemctl status apache2
