#!/bin/bash

###
# Install components for master node (zookeeper, stormUI) and setup nimbus node
##

ZOOKEEPER=zookeeper-3.4.6

cd /usr/local/
wget -q http://apache.crihan.fr/dist/zookeeper/$ZOOKEEPER/$ZOOKEEPER.tar.gz

tar xzvf $ZOOKEEPER.tar.gz 

# Symlinks in /usr/local: zookeeper
ln -s /usr/local/$ZOOKEEPER /usr/local/zookeeper

echo "*** Set log directory ***"
cd /var/log
mkdir zookeeper

cp $ROBOCONF_FILES_DIR/zoo.cfg    /usr/local/$ZOOKEEPER/conf
cp $ROBOCONF_FILES_DIR/nimbus.cfg /usr/local/supervisord
cp $ROBOCONF_FILES_DIR/storm.yaml /usr/local/storm/conf
echo "*** Done. ***"

