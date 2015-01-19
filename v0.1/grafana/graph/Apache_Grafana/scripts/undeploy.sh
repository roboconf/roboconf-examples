#!/bin/bash
cd /home/
apt-get remove -y --purge libapache2-mod-jk apache2
rm grafana-1.6.1.tar.gz
rm -rf grafana-1.6.1
rm -rf /var/www/html

