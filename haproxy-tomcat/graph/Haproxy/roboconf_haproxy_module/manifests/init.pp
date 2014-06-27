
define setupBalancer($ip, $port) {
  # Use IP as balancer name, because "${name}" may contain unsupported chars
  haproxy::balancermember { "${ip}":
    listening_service => 'balancer',
    ipaddresses       => "${ip}",
    ports             => "${port}"
  }
}


class roboconf_haproxy_module($runningState = undef, $importAdded = undef, $importRemoved = undef, $tomcat = undef) {

# 'tomcat' is an array of hashes
# It needs to be declared as the following:
# $tomcat = { 
#              'tomcat1' => {'ip' => '127.0.0.1', 'portajp' => '8009'},
#              'tomcat2' => {'ip' => '127.0.0.2', 'portajp' => '8010'}
#            }

  # Insert "mode http" option (requires all default options to be overridden...)
  # When no "mode http" is required, class { 'haproxy': } would be enough.
  class { 'haproxy':
    defaults_options => [ 'mode http', 'log global', 'maxconn 8000', 'option redispatch', 'retries 3', 'stats enable', 'timeout http-request 10s', 'timeout queue 1m', 'timeout connect 10s', 'timeout client 1m', 'timeout server 1m', 'timeout check 10s' ]
  }

  # Use 0.0.0.0 as IP address, for local host.
  haproxy::listen { 'balancer':
    ipaddress => "0.0.0.0",
    ports     => '80'
  }

  if $tomcat != undef {
    create_resources(setupBalancer, $tomcat)
  }

}
