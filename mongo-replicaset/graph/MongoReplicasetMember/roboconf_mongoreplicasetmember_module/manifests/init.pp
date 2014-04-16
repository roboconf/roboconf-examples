# Mongo & replicat set install
#
# This needs the dwerder-mongodb module to be installed before:
#
# puppet module install dwerder-mongodb
#
# To test, you can apply the current manifest wth puppet apply:
#
# puppet apply --verbose ./init.pp
#

class roboconf_mongoreplicasetmember_module($runningState = undef, $replicaset = undef, $mongoinstance = undef, $ip = undef, $port = undef) {

   include mongodb
   mongodb::mongod {
       'mongo':
          mongod_instance    => $mongoinstance,
          mongod_running     => $runningState == 'running',
          mongod_replSet     => "$replicaset",
          mongod_add_options => []
   }
}

