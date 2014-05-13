roboconf-examples
=================

Roboconf basic examples of cloud deployments.

Notes:
------

- On OpenStack, there may be issues concerning hostname and /etc/hosts. It may be necessary to run the following command at system startup (eg. in /etc/rc.local):<br/> ```echo 127.0.0.1 `hostname` >> /etc/hosts```
