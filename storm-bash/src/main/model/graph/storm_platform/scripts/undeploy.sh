#!/bin/bash

cd /usr/local/
rm -rf apache-storm-0.9.4 storm
rm apache-storm-0.9.4.tar.gz
rm /usr/local/bin/storm
cd /var/log
rm -rf storm supervisord
rm -rf /usr/local/supervisord
easy_install -m supervisor
rm -rf /usr/local/lib/python2.7/dist-package/supervisor-3.0-py2.7.egg
apt-get autoremove -y python-setuptools

