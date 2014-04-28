#!/bin/bash
ret="1"
while [ $ret -ne 0 ]
do
 /usr/bin/mongostat -n 1 | grep connected
 ret=$? 
 /bin/sleep 2
done
