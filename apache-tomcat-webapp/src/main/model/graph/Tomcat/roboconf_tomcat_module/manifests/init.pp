class roboconf_tomcat_module($runningState = undef, $importAdded = undef, $importRemoved = undef, $importComponent = undef, $ip = undef, $portajp = undef) {

  package{'tomcat7':
    ensure => present,
    before => Service['tomcat7'],
  }
  
  file{'/var/lib/tomcat7/webapps/ROOT/index.html':
    ensure  => file,
    content => template('roboconf_tomcat_module/index.html.erb'),
    require => Package['tomcat7'],
  }

  file{'/etc/tomcat7/server.xml':
    ensure  => file,
    source  => 'puppet:///modules/roboconf_tomcat_module/server.xml',
    owner   => 'root',
    group   => 'tomcat7',
    require => Package['tomcat7'],
  }
  
  service{'tomcat7':
    ensure    => $runningState,
    enable    => true,
    subscribe => Package['tomcat7'],
  }

}
