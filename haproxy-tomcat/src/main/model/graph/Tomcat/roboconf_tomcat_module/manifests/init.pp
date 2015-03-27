class roboconf_tomcat_module($runningState = undef, $importDiff = undef, $ip = undef, $port = undef) {

  package{'tomcat7':
    ensure => present,
    before => Service['tomcat7'],
  }
  
  file{'/var/lib/tomcat7/webapps/ROOT/index.html':
    ensure  => file,
    content => template('roboconf_tomcat_module/index.html.erb'),
    require => Package['tomcat7'],
  }

  service{'tomcat7':
    ensure    => $runningState,
    enable    => true,
    subscribe => Package['tomcat7'],
  }

}
