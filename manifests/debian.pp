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

	file { 
  	"sys-environment":
		ensure	=> file,
		path 	=> '/etc/environment',
		mode   	=> "0644",
		owner	=> 'root',
		group	=> 'root',
		source	=> "puppet:///modules/intel-proxy/environment",
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

    file {
	"gitconfig":
		ensure	=> file,
		path 	=> '/etc/gitconfig',
		mode   	=> "0644",
		owner	=> 'root',
		group	=> 'root',
		source	=> "puppet:///modules/intel-proxy/gitconfig";
	}
    file {
	"sshconfig":
		ensure	=> file,
		path 	=> '/home/vagrant/.ssh/config',
		mode   	=> "0600",
		owner	=> 'vagrant',
		group	=> 'vagrant',
		source	=> "puppet:///modules/intel-proxy/sshconfig";
	}
}
