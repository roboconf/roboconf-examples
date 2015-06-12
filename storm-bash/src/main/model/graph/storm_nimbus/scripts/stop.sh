#!/bin/bash

supervisorctl -c /usr/local/supervisord/nimbus.cfg stop storm-ui
supervisorctl -c /usr/local/supervisord/nimbus.cfg stop storm-nimbus

