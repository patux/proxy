#Class: no-proxy
class intel-proxy::debian-remove {

	#file { 
  	#"sudoers":
	#	ensure	=> file,
	#	path 	=> '/etc/sudoers',
	#	mode   	=> "0440",
	#	owner	=> 'root',
	#	group	=> 'root',
	#	source	=> "puppet:///modules/intel-proxy/sudoers",
	#}
	$files_to_remove = [ "/etc/apt/apt.conf.d/40proxy", "/etc/apt/apt.conf.d/11cache", "/etc/gitconfig", "/home/vagrant/.ssh/config" ]
    file { $files_to_remove: 
		ensure	=> absent,
	}
	file { "sys-environment":
		ensure	=> file,
		path 	=> '/etc/environment',
		mode   	=> "0644",
		owner	=> 'root',
		group	=> 'root',
		source	=> "puppet:///modules/intel-proxy/noproxy-environment",
	}
}
