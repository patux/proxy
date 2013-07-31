
class intel-proxy::redhat-remove {
	$files_to_remove = [ "/etc/profile.d/intel-proxy.sh", "/etc/profile.d/intel-proxy.csh", "/etc/gitconfig", "/home/vagrant/.ssh/config" ]
	file { $files_to_remove:
		ensure	=> absent,
	}
	file_line { 'yum_noproxy':
        path => '/etc/yum.conf',
        line => "proxy='_none_'",
    }

}

