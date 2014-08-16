#!/bin/bash

storm kill debs -w 0
pkill supervisord
pkill mosquitto


