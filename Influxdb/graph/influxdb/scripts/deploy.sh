#!/bin/bash

cd /home/
wget http://s3.amazonaws.com/influxdb/influxdb_latest_amd64.deb
dpkg -i influxdb_latest_amd64.deb

rm /opt/influxdb/versions/0.7.3/benchmark_config.toml
rm /opt/influxdb/versions/0.7.3/config.toml
cp $ROBOCONF_FILES_DIR/benchmark_config.toml /opt/influxdb/versions/0.7.3
cp $ROBOCONF_FILES_DIR/config.toml /opt/influxdb/versions/0.7.3

/etc/init.d/influxdb stop
