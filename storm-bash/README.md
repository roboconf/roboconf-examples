## Deployment of a Storm cluster...

... with Zookeeper and Supervisord.

Files:
- **nimbus.cfg**, **worker.cfg**: files used by Supervisord, on either the nimbus or the worker(s) nodes.
- **zoo.cfg**: the configuration for Zookeeper.
- **storm.yaml**: the configuration for Storm.

Note: the URLs to download storm/zookeeper binary packages from apache servers
are in the corresponding "scripts/deplopy.sh" files (in either storm_platform, storm_nimbus or storm_worker component directories).
If these URLs are outdated, fix them.

To start your topology, submit it to the nimbus node using "storm jar" command.

