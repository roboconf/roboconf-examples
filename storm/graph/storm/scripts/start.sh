#!/bin/bash
mosquitto &
cd /home/supervisord/
supervisord -c worker.cfg
supervisord -c nimbus.cfg
sleep 60
cd ..
storm jar topo.jar debs.DEBSTridentMain debs 
