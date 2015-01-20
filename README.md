# Roboconf Examples
[![License](https://pypip.in/license/apache-libcloud/badge.png)](http://www.apache.org/licenses/LICENSE-2.0)

Website: [http://roboconf.net](http://roboconf.net)  
Licensed under the terms of the **Apache License v2**.

Some examples of Roboconf projects for cloud deployments.

Notes
-----

On OpenStack, there may be issues concerning **hostname** and **/etc/hosts**.  
It may be necessary to run the following command at system startup (e.g. in **/etc/rc.local**).

```bash
echo 127.0.0.1 `hostname` >> /etc/hosts
```
