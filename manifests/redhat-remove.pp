
class proxy::redhat-remove {
	$files_to_remove = [ "/etc/profile.d/proxy.sh", "/etc/profile.d/proxy.csh", "/etc/gitconfig",]
	file { $files_to_remove:
		ensure	=> absent,
	}
	file_line { 'yum_noproxy':
        path => '/etc/yum.conf',
        line => "proxy='_none_'",
    }

	file { "/etc/ssh/ssh_config":
		ensure	=> file,
		mode   	=> "0644",
		owner	=> 'root',
		group	=> 'root',
		source	=> "puppet:///modules/proxy/ssh_config-noproxy",
	}
}

