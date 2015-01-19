#!/bin/bash

apt-get remove -y --purge libapache2-mod-jk apache2
rm -rf /opt/influxdb/*
dpkg -P influxdb
cd ~
rm grafana-1.6.1.tar.gz
rm -r grafana-1.6.1
rm -rf /var/www/html
rm influxdb_latest_amd64.deb
