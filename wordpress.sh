#!/bin/bash
#Installing Dependeencies
sudo apt update
sudo apt install apache2 \
                 ghostscript \
                 libapache2-mod-php \
                 mysql-server \
                 php \
                 php-bcmath \
                 php-curl \
                 php-imagick \
                 php-intl \
                 php-json \
                 php-mbstring \
                 php-mysql \
                 php-xml \
                 php-zip

#installing wordpress
sudo mkdir -p /srv/www
sudo chown www-data: /srv/www
curl https://wordpress.org/latest.tar.gz | sudo -u www-data tar zx -C /srv/www

#Configure Apache2 for wordpress

cp /vagrant/wordpresscopy.conf /etc/apache2/sites-available/wordpress.conf

#Enable the site with:
sudo a2ensite wordpress
sudo systemctl apache2 reload

#Enable URL rewriting with:
sudo a2enmod rewrite
sudo systemctl apache2 reload

#Disable the default “It Works” site with:
sudo a2dissite 000-default
sudo systemctl apache2 reload