#!/bin/bash
PATH=$PATH:/usr/local/bin
export PATH

supervisord -c /usr/local/supervisord/nimbus.cfg
supervisorctl -c /usr/local/supervisord/nimbus.cfg start all
sleep 10
cd ..

