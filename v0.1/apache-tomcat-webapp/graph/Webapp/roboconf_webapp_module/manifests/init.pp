class roboconf_webapp_module($runningState = undef) {

  file{'/var/lib/tomcat7/webapps/roboconf-hello':
    ensure  => directory,
    source  => 'puppet:///modules/roboconf_webapp_module/roboconf-hello',
    recurse => true,
    notify  => Service['tomcat7'],
  }

  service{'tomcat7':
    ensure    => $runningState,
    enable    => true,
  }

}
