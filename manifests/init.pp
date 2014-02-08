class proxy ($http_proxy_host = "", $http_proxy_port = "", $https_proxy_host = "", $https_proxy_port = "", $ftp_proxy_host = "", $ftp_proxy_port = "", $socks_proxy_host = "", $socks_proxy_port = "", $no_proxy_domains = "" ) {
  case $::operatingsystem {
    'centos', 'fedora', 'redhat', 'scientific': {
      $packages  = [ "nc", "corkscrew" ]
      class { 'proxy::redhat': }
    }
    'debian', 'ubuntu': {
      $packages = [ "netcat-openbsd", "corkscrew" ]
      class { 'proxy::debian': }
    }
    'OpenSuSE', 'sles': {
      $packages = [ "netcat-openbsd", "corkscrew" ]
      class { 'proxy::suse': }
    }
    default: {
      fail("Module '${module_name}' is not currently supported by ${::operatingsystem}")
    }
  } 
  package { $packages:
   ensure => installed,
  }
} 

