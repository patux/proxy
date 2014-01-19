class setsocks {
	if (! $proxy::socks_proxy_host) and  (!$proxy::socks_proxy_port) {
	    package { "corkscrew":
		ensure  => installed,
	    }
	}
}
class proxy ($http_proxy_host = undef, $http_proxy_port = undef, $https_proxy_host = undef, $https_proxy_port = undef, $ftp_proxy_host = undef, $ftp_proxy_port = undef, $socks_proxy_host = undef, $socks_proxy_port = undef, $no_proxy_domains = undef ) {
  case $::operatingsystem {
    'centos', 'fedora', 'redhat', 'scientific': {
      $nc_package = "nc"
      class { 'proxy::redhat': } ->
	package { $nc_package:
	    ensure  => installed,
	} -> 
      class { 'setsocks': }
    }
    'debian', 'ubuntu': {
      $nc_package = "netcat-openbsd" 
      class { 'proxy::debian': } ->
	package { $nc_package:
	    ensure  => installed,
	} -> 
      class { 'setsocks': }
    }
    'OpenSuSE', 'sles': {
      $nc_package =  "netcat-openbsd" 
      class { 'proxy::suse': } ->
	package { $nc_package:
	    ensure  => installed,
	} -> 
      class { 'setsocks': }

    }
    default: {
      fail("Module '${module_name}' is not currently supported by ${::operatingsystem}")
    }
  } 
} 

