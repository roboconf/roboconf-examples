class roboconf_mongoprimaryconfig_module::start($runningState = undef, $mongoreplicasetmember = undef) {

# replica-set members is an array of hashes
# It needs to be declared as the following:
# $mongoreplicasetmember = { 
#              'mongo1' => {'ip' => '127.0.0.1', 'port' => '8009'},
#              'mongo2' => {'ip' => '127.0.0.2', 'port' => '8010'}
#            }

  if $mongoreplicasetmember != undef and $runningState != 'stopped' {
    file{'/tmp/mongoPrimaryConfig.js':
      ensure  => file,
      content => template('roboconf_mongoprimaryconfig_module/mongoPrimaryConfig.js.erb'),
    }

    exec { "configure_mongo_replicaset":
      command => "/bin/sleep 10 && /usr/bin/mongo < /tmp/mongoPrimaryConfig.js",
      require => File['/tmp/mongoPrimaryConfig.js'],
      tries => 10,
      try_sleep => 10
    }
  }

}
