
class proxy::suse {
	file { "/etc/profile.d/proxy.sh":
		ensure	=> file,
		mode   	=> "0644",
		owner	=> 'root',
		group	=> 'root',
        content => template('proxy/proxy.sh.erb'),
	}
	file { "/etc/profile.d/proxy.csh":
		ensure	=> file,
		mode   	=> "0644",
		owner	=> 'root',
		group	=> 'root',
        content => template('proxy/proxy.csh.erb'),
	}

    file { '/etc/sysconfig/proxy':
   		mode   	=> "0644",
		owner	=> 'root',
		group	=> 'root',
        content => template('proxy/suseproxy.erb'),
    }

    file_line { 'sudo_rule':
        path => '/etc/sudoers',
        line => 'Defaults        env_keep += "http_proxy https_proxy ftp_proxy no_proxy socks_proxy"',
    }
    if $http_proxy_host != "nil" {
        file { '/etc/gitconfig':
            ensure	=> file,
            mode   	=> "0644",
            owner	=> 'root',
            group	=> 'root',
            source	=> "puppet:///modules/proxy/gitconfig";
        }
	}
    file { '/etc/ssh/ssh_config':
		ensure	=> file,
        owner => root,
        group => root,
        mode => '0644',
        content => template('proxy/ssh_config.erb'),
	}
}

