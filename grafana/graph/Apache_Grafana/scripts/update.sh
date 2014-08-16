#!/bin/bash

cp $ROBOCONF_FILES_DIR/default /etc/apache2/sites-available
cp $ROBOCONF_FILES_DIR/config.js /var/www/html
cp $ROBOCONF_FILES_DIR/default.json /var/www/html/app/dashboards

apache2ctl restart

