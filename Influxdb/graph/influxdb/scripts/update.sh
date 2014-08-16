#!/bin/bash


rm /opt/influxdb/versions/0.7.3/benchmark_config.toml
rm /opt/influxdb/versions/0.7.3/config.toml
cp $ROBOCONF_FILES_DIR/benchmark_config.toml /etc/apache2/sites-available
cp $ROBOCONF_FILES_DIR/config.toml /etc/apache2/sites-available

/etc/init.d/influxdb restart
