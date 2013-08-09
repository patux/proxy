Module Description
====================
Setup or Removes the Proxy configuration on Linux boxes

This module depends on stdlib from puppetlabs to work: [https://github.com/puppetlabs/puppetlabs-stdlib](https://github.com/puppetlabs/puppetlabs-stdlib)
In case you do not have access to internet (for obvious reasons, not setting the proxy yet :P ) You can take it from vendor directory (included here)
and move to your modules directory:


Current OS Supported:
====================
  * Redhat based:
    * centos, fedora, redhat, scientific linux
  * Debian based:
    * debian, ubuntu
  * SuSE based:
    * OpenSuSE/SLES/SLED


Usage:
====================
Setup the proxy:
----------------
    node default {
        class { 'proxy': 
            http_proxy_host  =>  "myproxy.url.com", 
            http_proxy_port  => "3128", 
            https_proxy_host =>  "myproxy.url.com", 
            https_proxy_port => "3128", 
            socks_proxy_host =>  "myproxy.url.com", 
            socks_proxy_port => "3128", 
            ftp_proxy_host   =>  "myproxy.url.com", 
            ftp_proxy_port   => "3128", 
            no_proxy_domains => ".intel.com" 
        }
    }

Remove the proxy:
----------------
    node default { 
        class { 'proxy::remove': } 
    } 


Example:
-------

    $ mkdir -p puppet/modules
    $ cd puppet/modules
    $ git clone https://github.intel.com/gorozco1/pm-intel-proxy proxy
    $ cd proxy
    $ mv vendor/stdlib ../
    $ cd tests
    $ puppet apply --modulepath=../../ setup.pp


