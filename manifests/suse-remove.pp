#Class: no-proxy
class proxy::suse-remove {

	#file { 
  	#"sudoers":
	#	ensure	=> file,
	#	path 	=> '/etc/sudoers',
	#	mode   	=> "0440",
	#	owner	=> 'root',
	#	group	=> 'root',
	#	source	=> "puppet:///modules/proxy/sudoers",
	#}
	$files_to_remove = [ "/etc/profile.d/proxy.sh", "/etc/profile.d/proxy.csh", "/etc/gitconfig" ]
	file { $files_to_remove: 
		ensure	=> absent,
	}
    file { '/etc/sysconfig/proxy':
   		mode   	=> "0644",
		owner	=> 'root',
		group	=> 'root',
		source	=> "puppet:///modules/proxy/no-proxy",
    }

	file { "/etc/ssh/ssh_config":
		ensure	=> file,
		mode   	=> "0644",
		owner	=> 'root',
		group	=> 'root',
		source	=> "puppet:///modules/proxy/ssh_config-noproxy",
	}
}
