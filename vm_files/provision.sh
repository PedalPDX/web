#! /usr/bin/env bash
#
# PedalPortland Capstone Project (c)
#
# Simple Bash Provisioning Script

# check if required permissions exist before continuing
if [[ $UID -ne 0 ]]; then
    echo "$0 must be run as root"
    exit 1
fi
        
# update machine before installing required applications
apt-get update
apt-get upgrade -y
apt-get install -y python-dev python-pip byobu apache2 libapache2-mod-wsgi

pip install flask

a2dissite default
rm /var/www/index.html
chmod -R a+rx /var/www/pedalpdx.com
ln -s /vagrant/pedalpdx.com.conf /etc/apache2/sites-available/pedalpdx.com.conf
a2ensite pedalpdx.com.conf
service apache2 restart
