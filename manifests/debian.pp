#Class: intel-proxy
class intel-proxy::debian {

    file {
    "apt-cachelimit":
        ensure  => file,
        path    => '/etc/apt/apt.conf.d/11cache',
        mode    => "0644",
        owner   => 'root',
        group   => 'root',
        source  => "puppet:///modules/intel-proxy/11cache",
        before  => File["apt-proxy"], 
    }

    file_line { 'sudo_rule':
        path => '/etc/sudoers',
        line => 'Defaults        env_keep += "http_proxy https_proxy ftp_proxy no_proxy socks_proxy"',
    }

	file { '/etc/environment':
		ensure	=> file,
		mode   	=> "0644",
		owner	=> 'root',
		group	=> 'root',
        content => template('intel-proxy/environment.erb'),
	}
	file {
	"apt-proxy":
		ensure	=> file,
		path 	=> '/etc/apt/apt.conf.d/40proxy',
		mode   	=> "0644",
		owner	=> 'root',
		group	=> 'root',
		source	=> "puppet:///modules/intel-proxy/40proxy",
	}

    file { '/etc/gitconfig':
		ensure	=> file,
		mode   	=> "0644",
		owner	=> 'root',
		group	=> 'root',
		source	=> "puppet:///modules/intel-proxy/gitconfig";
	}
    file { '/etc/ssh/ssh_config':
		ensure	=> file,
        owner => root,
        group => root,
		mode  => "0644",
        content => template('intel-proxy/ssh_config.erb'),
	}
}
