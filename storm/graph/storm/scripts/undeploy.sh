#!/bin/bash

cd /home/
rm -rf storm-0.8.2
rm -rf zookeeper-3.4.5
rm storm-0.8.2.zip
rm zookeeper-3.4.5.tar.gz
rm topo.jar
rm /usr/local/bin/storm
rm -rf log
easy_install -m supervisor
rm -rf /usr/local/lib/python2.7/dist-package/supervisor-3.0-py2.7.egg
apt-get autoremove -y  python-setuptools  mosquitto gcc g++ uuid-dev make pkg-config libtool autoconf automake

