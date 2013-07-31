class intel-proxy {
  case $::operatingsystem {
    'centos', 'fedora', 'redhat', 'scientific': {
      class { 'intel-proxy::redhat': }
    }
    'debian', 'ubuntu': {
      class { 'intel-proxy::debian': }
    }
    'OpenSuSE', 'sles': {
      class { 'intel-proxy::suse': }
    }
    default: {
      fail("Module '${module_name}' is not currently supported by ${::operatingsystem}")
    }
  }

}
