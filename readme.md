# Roboconf Examples
[![License](https://img.shields.io/hexpm/l/plug.svg)](http://www.apache.org/licenses/LICENSE-2.0)
[![Join us on Gitter.im](https://img.shields.io/badge/gitter-join%20chat-brightgreen.svg)](https://gitter.im/roboconf/roboconf)
[![Web site](https://img.shields.io/badge/website-roboconf.net-b23e4b.svg)](http://roboconf.net)

Some examples of Roboconf projects for cloud deployments.

Notes
-----

On OpenStack, there may be issues concerning **hostname** and **/etc/hosts**.  
It may be necessary to run the following command at system startup (e.g. in **/etc/rc.local**).

```bash
echo 127.0.0.1 `hostname` >> /etc/hosts
```
