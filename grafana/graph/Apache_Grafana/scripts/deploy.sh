#!/bin/bash
cd ~

apt-get install -y apache2 libapache2-mod-jk
cp $ROBOCONF_FILES_DIR/default /etc/apache2/sites-available

wget http://grafanarel.s3.amazonaws.com/grafana-1.6.1.tar.gz
tar -xf grafana-1.6.1.tar.gz
rm -rf /var/www/html/*
cp -a grafana-1.6.1/* /var/www/html

cp $ROBOCONF_FILES_DIR/config.js /var/www/html
cp $ROBOCONF_FILES_DIR/default.json /var/www/html/app/dashboards

apache2ctl stop

