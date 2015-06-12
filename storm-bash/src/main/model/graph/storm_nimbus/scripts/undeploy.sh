#!/bin/bash

supervisorctl -c /usr/local/supervisord/nimbus.cfg shutdown
rm /usr/local/supervisord/nimbus.cfg

rm /usr/local/storm/conf/storm.yaml
cd /usr/local/
rm -rf zookeeper-3.4.5 zookeeper
rm zookeeper-3.4.5.tar.gz
rm -rf /var/log/zookeeper

