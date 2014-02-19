class proxy ($http_proxy_host = "", $http_proxy_port = "", $https_proxy_host = "", $https_proxy_port = "", $ftp_proxy_host = "", $ftp_proxy_port = "", $socks_proxy_host = "", $socks_proxy_port = "", $no_proxy_domains = "" ) {
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

