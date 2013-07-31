#Class: no-proxy
class intel-proxy::remove {
  case $::operatingsystem {
    'centos', 'fedora', 'redhat', 'scientific': {
      class { 'intel-proxy::redhat-remove': }
    }
    'debian', 'ubuntu': {
      class { 'intel-proxy::debian-remove': }
    }
    'OpenSuSE', 'sles': {
      class { 'intel-proxy::suse-remove': }
    }
    default: {
      fail("Module '${module_name}' is not currently supported by ${::operatingsystem}")
    }
  }

}
