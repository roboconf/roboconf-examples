#!/bin/bash
supervisord -c /usr/local/supervisord/nimbus.cfg
supervisorctl -c /usr/local/supervisord/nimbus.cfg start all
sleep 10
cd ..

