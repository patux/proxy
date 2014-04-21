node default {
    class { 'proxy':
        http_proxy_host  =>  nil,
        http_proxy_port  =>  nil,
        https_proxy_host =>  nil,
        https_proxy_port =>  nil,
        socks_proxy_host =>  nil,
        socks_proxy_port =>  nil,
        ftp_proxy_host   =>  nil,
        ftp_proxy_port   =>  nil,
        no_proxy_domains =>  nil,
    }
}

