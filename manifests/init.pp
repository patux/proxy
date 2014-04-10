class proxy ($http_proxy_host = nil, $http_proxy_port = nil, $https_proxy_host = nil, $https_proxy_port = nil, $ftp_proxy_host = nil, $ftp_proxy_port = nil, $socks_proxy_host = nil, $socks_proxy_port = nil, $no_proxy_domains = nil ) {
  case $::operatingsystem {
    'centos', 'fedora', 'redhat', 'scientific': {
      $nc_package = "nc"
      class { 'proxy::redhat': }
    }
    'debian', 'ubuntu': {
      $nc_package = "netcat-openbsd"
      class { 'proxy::debian': }
    }
    'OpenSuSE', 'sles': {
      $nc_package = "netcat-openbsd"
      class { 'proxy::suse': }
    }
    default: {
      fail("Module '${module_name}' is not currently supported by ${::operatingsystem}")
    }
  } 
  package { $nc_package:
   ensure => installed,
  }
} 

