#!/bin/bash

###
# Installs Storm base platform
##

STORM=apache-storm-0.9.4

# If storm already installed (eg. on image with storm), exit !
if [ -d "/usr/local/$STORM" ]; then
  exit 0
fi

echo "*** Update aptitude ***"
apt-get update -qq

mkdir -p /usr/local/bin
cd /usr/local/
apt-get install -yqq wget
wget -q http://apache.crihan.fr/dist/storm/apache-storm-0.9.4/$STORM.tar.gz

tar xvzf $STORM.tar.gz

echo "*** Provide symlinks to storm ***"
ln -s /usr/local/$STORM/bin/storm /usr/local/bin/storm

# Symlinks in /usr/local: storm and zookeeper
ln -s /usr/local/$STORM /usr/local/storm

apt-get install -yqq default-jdk

echo "*** Install Supervisord ***"
apt-get -yqq install python-setuptools
easy_install supervisor
mkdir -p /usr/local/supervisord

echo "*** Set log directory ***"
cd /var/log
mkdir storm
mkdir supervisord

echo "*** Done. ***"

