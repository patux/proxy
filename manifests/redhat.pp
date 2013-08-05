
class intel-proxy::redhat {
	file { "/etc/profile.d/intel-proxy.sh":
		ensure	=> file,
		mode   	=> "0755",
		owner	=> 'root',
		group	=> 'root',
        content => template('intel-proxy/intel-proxy.sh.erb'),
	}
	file { "/etc/profile.d/intel-proxy.csh":
		ensure	=> file,
		mode   	=> "0755",
		owner	=> 'root',
		group	=> 'root',
        content => template('intel-proxy/intel-proxy.csh.erb'),
	}

    file_line { 'yum_proxy':
        path => '/etc/yum.conf',
        line => 'proxy=http://proxy-us.intel.com:911',
    }
    file_line { 'sudo_rule':
        path => '/etc/sudoers',
        line => 'Defaults        env_keep += "http_proxy https_proxy ftp_proxy no_proxy socks_proxy"',
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
        mode => '0644',
        content => template('intel-proxy/ssh_config.erb'),
	}
}

