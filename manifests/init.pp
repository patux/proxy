class proxy ($http_proxy_host = "proxy-us.intel.com", $http_proxy_port = "911", $https_proxy_host = "proxy-us.intel.com", $https_proxy_port = "911", $ftp_proxy_host = "proxy-us.intel.com", $ftp_proxy_port = "911", $socks_proxy_host = "proxy-skype.intel.com", $socks_proxy_port = "1080", $no_proxy_domains = ".intel.com" ) {
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

