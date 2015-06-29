#!/bin/bash
PATH=$PATH:/usr/local/bin
export PATH

NIMBUS_IP=$storm_nimbus_0_ip
cp $ROBOCONF_FILES_DIR/storm.yaml /usr/local/storm/conf
echo nimbus.host: \"$NIMBUS_IP\" >> /usr/local/storm/conf/storm.yaml
echo storm.zookeeper.servers: >> /usr/local/storm/conf/storm.yaml
echo "    "- \"$NIMBUS_IP\" >> /usr/local/storm/conf/storm.yaml

supervisord -c /usr/local/supervisord/worker.cfg
supervisorctl -c /usr/local/supervisord/worker.cfg start all
sleep 10
cd ..

