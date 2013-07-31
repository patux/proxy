Module Description
====================
Setup or Removes the Intel Proxy configuration on Linux boxes

This module depends on stdlib from puppetlabs to work: [https://github.com/puppetlabs/puppetlabs-stdlib](https://github.com/puppetlabs/puppetlabs-stdlib)


Current OS Supported:
====================
  * Redhat based:
    * centos, fedora, redhat, scientific linux
  * Debian based:
    * debian, ubuntu
  * SuSE based:
    * opensuse


Usage:
====================
Setup the intel proxy:
----------------
<code>
    node default {
        class { 'intel-proxy': }
    }
</code>

Remove the intel proxy:
----------------
<code>
    node default { 
        class { 'intel-proxy::remove': } 
    } 
</code>


