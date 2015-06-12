#!/bin/bash

supervisorctl -c /usr/local/supervisord/worker.cfg shutdown
rm /usr/local/supervisord/worker.cfg

rm /usr/local/storm/conf/storm.yaml

