class roboconf_apache_module($runningState = undef, $importAdded = undef, $importRemoved = undef, $tomcat = undef) {

# 'tomcat' is an array of hashes
# It needs to be declared as the following:
# $tomcat = { 
#              'tomcat1' => {'ip' => '127.0.0.1', 'port' => '8009'},
#              'tomcat2' => {'ip' => '127.0.0.2', 'port' => '8010'}
#            }

  package{'apache2':
    ensure => present,
    before => Service['apache2'],
  }

  package{'libapache2-mod-jk':
    ensure  => present,
    before  => Service['apache2'],
    require => Package['apache2'],
  }

  if $tomcat != undef {
    file{'/etc/libapache2-mod-jk/workers.properties':
      ensure  => file,
      content => template('roboconf_apache_module/workers.properties.erb'),
      owner   => 'root',
      group   => 'root',
      notify  => Service['apache2'],
      require => Package['libapache2-mod-jk'],
    }
  }

  file{'/etc/apache2/sites-available/default':
    ensure  => file,
    source  => 'puppet:///modules/roboconf_apache_module/default',
    owner   => 'root',
    group   => 'root',
    notify  => Service['apache2'],
    require => Package['apache2'],
  }

  service{'apache2':
    ensure    => $runningState,
    enable    => true,
    require   => Package['apache2'],
    subscribe => Package['apache2', 'libapache2-mod-jk'],
  }

}
