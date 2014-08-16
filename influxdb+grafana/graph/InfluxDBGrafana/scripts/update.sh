#!/bin/bash

cp $ROBOCONF_FILES_DIR/default /etc/apache2/sites-available/
cp $ROBOCONF_FILES_DIR/config.js /var/www/html
cp $ROBOCONF_FILES_DIR/default.json /var/www/html/app/dashboards

rm /opt/influxdb/versions/0.7.3/benchmark_config.toml
rm /opt/influxdb/versions/0.7.3/config.toml
cp $ROBOCONF_FILES_DIR/benchmark_config.toml /opt/influxdb/versions/0.7.3/
cp $ROBOCONF_FILES_DIR/config.toml /opt/influxdb/versions/0.7.3/

/etc/init.d/influxdb restart

apache2ctl restart


