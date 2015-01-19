#!/bin/bash
cd ~
apt-get install -y apache2 libapache2-mod-jk
cp $ROBOCONF_FILES_DIR/grafana/default /etc/apache2/sites-available

wget http://s3.amazonaws.com/influxdb/influxdb_latest_amd64.deb
dpkg -i influxdb_latest_amd64.deb

rm /opt/influxdb/versions/0.7.3/benchmark_config.toml
rm /opt/influxdb/versions/0.7.3/config.toml
cp $ROBOCONF_FILES_DIR/influxdb/benchmark_config.toml /opt/influxdb/versions/0.7.3
cp $ROBOCONF_FILES_DIR/influxdb/config.toml /opt/influxdb/versions/0.7.3

/etc/init.d/influxdb stop

wget http://grafanarel.s3.amazonaws.com/grafana-1.6.1.tar.gz
tar -xf grafana-1.6.1.tar.gz
rm -rf /var/www/html/*
cp -a grafana-1.6.1/* /var/www/html

cp $ROBOCONF_FILES_DIR/grafana/config.js /var/www/html
cp $ROBOCONF_FILES_DIR/grafana/default.json /var/www/html/app/dashboards

apache2ctl stop

