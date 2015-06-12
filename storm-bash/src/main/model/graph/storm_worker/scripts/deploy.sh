#!/bin/bash

###
# Setup storm worker
##

cp $ROBOCONF_FILES_DIR/worker.cfg /usr/local/supervisord
cp $ROBOCONF_FILES_DIR/storm.yaml /usr/local/storm/conf
echo "*** Done. ***"

