#!/bin/bash

NIMBUS_IP=$storm_nimbus_0_ip
cp $ROBOCONF_FILES_DIR/storm.yaml /usr/local/storm/conf
echo nimbus.host: \"$NIMBUS_IP\" >> /usr/local/storm/conf/storm.yaml
echo storm.zookeeper.servers: >> /usr/local/storm/conf/storm.yaml
echo "    "- \"$NIMBUS_IP\" >> /usr/local/storm/conf/storm.yaml

supervisorctl -c /usr/local/supervisord/worker.cfg stop storm-supervisor
sleep 10
supervisorctl -c /usr/local/supervisord/worker.cfg start storm-supervisor
sleep 10

