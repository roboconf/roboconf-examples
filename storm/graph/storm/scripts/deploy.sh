#!/bin/bash

###
# Installs Storm dependencies for the user 'erods'.
# /!\ erods should be able to sudo without password.
#
# Author: Ahmed El Rheddane
##




STORM=storm-0.8.2
ZOOKEEPER=zookeeper-3.4.5
ZMQ=zeromq-2.1.7
JZMQ=jzmq-master

cd /home/
wget http://apache.crihan.fr/dist/zookeeper/zookeeper-3.4.5/zookeeper-3.4.5.tar.gz
wget https://www.dropbox.com/s/fl4kr7w0oc8ihdw/storm-0.8.2.zip
wget http://download.zeromq.org/zeromq-2.1.7.zip
wget https://github.com/zeromq/jzmq/archive/master.zip

unzip $STORM.zip
unzip $ZMQ.zip
unzip master.zip
tar -xzvf $ZOOKEEPER.tar.gz 

cp $ROBOCONF_FILES_DIR/topo.jar /home


echo "*** Link to binaries ***"

ln -s /home/$STORM/bin/storm /usr/local/bin/storm

echo "*** Update aptitude ***"
apt-get update
apt-get install -y default-jdk

echo
cd /home/$ZMQ/
sudo apt-get -y install gcc g++ uuid-dev make
./configure
make
sudo make install
cd ..
rm -rf $ZMQ

echo "*** Install JZMQ ***"
cd /home/$JZMQ/
sudo apt-get -y install pkg-config libtool autoconf automake
./autogen.sh
./configure
cd src
touch classdist_noinst.stamp
CLASSPATH=.:./.:$CLASSPATH javac -d . org/zeromq/ZMQ.java org/zeromq/ZMQException.java org/zeromq/ZMQQueue.java org/zeromq/ZMQForwarder.java org/zeromq/ZMQStreamer.java
cd ..
make
sudo make install
cd ..
sudo rm -rf $JZMQ
echo "*** Install Supervisord ***"
apt-get -y install python-setuptools
easy_install supervisor



echo "*** Install Mosquitto ***"
add-apt-repository ppa:mosquitto-dev/mosquitto-ppa
apt-get update
apt-get -y install mosquitto
update-rc.d -f mosquitto remove
mosquitto stop



echo "*** Set log directory ***"
mkdir log
mkdir log/super
mkdir log/storm
mkdir log/zookeeper
mkdir supervisord


cp $ROBOCONF_FILES_DIR/zoo.cfg    /home/$ZOOKEEPER/conf
cp $ROBOCONF_FILES_DIR/nimbus.cfg /home/supervisord
cp $ROBOCONF_FILES_DIR/worker.cfg /home/supervisord
cp $ROBOCONF_FILES_DIR/storm.yaml /home/$STORM/conf
echo "*** Done. ***"
