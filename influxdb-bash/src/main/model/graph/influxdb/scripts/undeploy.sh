#!/bin/bash

cd ~
dpkg -P influxdb
rm -rf /opt/influxdb
rm influxdb_latest_amd64.deb


