#Class: no-proxy
class intel-proxy::suse-remove {

	#file { 
  	#"sudoers":
	#	ensure	=> file,
	#	path 	=> '/etc/sudoers',
	#	mode   	=> "0440",
	#	owner	=> 'root',
	#	group	=> 'root',
	#	source	=> "puppet:///modules/intel-proxy/sudoers",
	#}
	$files_to_remove = [ "/etc/profile.d/intel-proxy.sh", "/etc/profile.d/intel-proxy.csh", "/etc/gitconfig", "/home/vagrant/.ssh/config" ]
	file { $files_to_remove: 
		ensure	=> absent,
	}
    file { '/etc/sysconfig/proxy':
   		mode   	=> "0644",
		owner	=> 'root',
		group	=> 'root',
		source	=> "puppet:///modules/intel-proxy/no-proxy",
    }
}