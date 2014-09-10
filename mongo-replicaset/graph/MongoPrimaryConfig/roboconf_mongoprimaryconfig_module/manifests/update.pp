class roboconf_mongoprimaryconfig_module::update($runningState = undef, $mongoreplicasetmember = undef, $importAdded = undef, $importRemoved = undef, $importComponent = undef) {

  # replica-set members is an array of hashes, eg.
  # $mongoreplicasetmember = { 
  #   'mongo1' => {'ip' => '127.0.0.1', 'port' => '8009'},
  #   'mongo2' => {'ip' => '127.0.0.2', 'port' => '8010'}
  # }
  # importAdded (or importRemoved) is a single hash, eg.
  # $importAdded = {
  #    'mongo1' => {'ip' => '127.0.0.1', 'port' => '8009'}
  # }

  # Generate a temporary file name... to limit risk of overwriting
  $tstamp = generate('/bin/date', '+%s')
  $tempFile = inline_template('<%= @tstamp.chomp %>')

  # A new node is expected to be added: it is specified as importAdded
  if $importAdded != undef {

    # Generate a mongo script to add a node to the replica set.
    # Requires that the node be started (up and running).
    file{"/tmp/${tempFile}.js":
      require => Exec["check_mongo"],
      ensure  => file,
      content => template('roboconf_mongoprimaryconfig_module/mongoPrimaryAddNode.js.erb')
    }

    # Generate a script to check that the mongo node is running.
    file{"/tmp/checkmongo${tempFile}.sh":
      ensure  => file,
      mode => 755,
      content => template('roboconf_mongoprimaryconfig_module/checkmongo.sh.erb')
    }

    # Check that the expected mongo node is running (using mongostat).
    # Requires that the check script be generated.
    exec { "check_mongo":
      command => "/tmp/checkmongo${tempFile}.sh",
      require => File["/tmp/checkmongo${tempFile}.sh"]
    }

    # Add a node to the mongo replica set.
    # Should run only when we are sure that the node is up and running !
    exec { "add_mongo_node_to_replicaset":
      command => "/usr/bin/mongo < /tmp/${tempFile}.js",
      require => File["/tmp/${tempFile}.js"],
      tries => 10,
      try_sleep => 10,
      logoutput => on_failure
    }

  }
  # End adding new node

  # A node is expected to be removed: it is specified as importRemoved
  if $importRemoved != undef {

    # Generate a mongo script to remove a node from the replica set.
    file{"/tmp/${tempFile}.js":
      ensure  => file,
      content => template('roboconf_mongoprimaryconfig_module/mongoPrimaryRemoveNode.js.erb')
    }

    # Remove a node from the mongo replica set.
    exec { "remove_mongo_node_from_replicaset":
      command => "/usr/bin/mongo < /tmp/${tempFile}.js",
      require => File["/tmp/${tempFile}.js"],
      tries => 10,
      try_sleep => 10,
      logoutput => on_failure
    }
  }
  # End removing node

}
