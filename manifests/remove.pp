#Class: no-proxy
class proxy::remove {
  case $::operatingsystem {
    'centos', 'fedora', 'redhat', 'scientific': {
      class { 'proxy::redhat-remove': }
    }
    'debian', 'ubuntu': {
      class { 'proxy::debian-remove': }
    }
    'OpenSuSE', 'sles': {
      class { 'proxy::suse-remove': }
    }
    default: {
      fail("Module '${module_name}' is not currently supported by ${::operatingsystem}")
    }
  }

}
