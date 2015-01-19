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
      require => Exec["check_mongo"],
      content => template('roboconf_mongoprimaryconfig_module/mongoPrimaryConfig.js.erb'),
    }

    # Generate a script to check that the mongo node is running.
    file{"/tmp/checkmongo.sh":
      ensure  => file,
      mode => 755,
      source => "puppet:///modules/roboconf_mongoprimaryconfig_module/checkmongo.sh"
    }

    # Check that the expected mongo node is running (using mongostat).
    # Requires that the check script be generated.
    exec { "check_mongo":
      command => "/tmp/checkmongo.sh",
      require => File["/tmp/checkmongo.sh"]
    }

    # Add a node to the mongo replica set.
    # Should run only when we are sure that the node is up and running !
    exec { "configure_mongo_replicaset":
      command => "/usr/bin/mongo < /tmp/mongoPrimaryConfig.js",
      require => File['/tmp/mongoPrimaryConfig.js'],
      tries => 10,
      try_sleep => 10,
      logoutput => on_failure
    }
  }

}

