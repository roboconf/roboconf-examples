#!/bin/bash

yes | apt-get install apache2 libapache2-mod-jk
cp $ROBOCONF_FILES_DIR/default /etc/apache2/sites-available/

apache2ctl stop

