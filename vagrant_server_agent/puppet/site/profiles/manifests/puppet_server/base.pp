class profiles::puppet_server::base {

  file { [ '/etc/puppet', '/etc/puppet/files' ]:
    ensure => directory,
    before => Package[ 'puppetmaster' ]
  }

  package { 'puppetmaster':
    ensure => present,
    name   => $package_name
  }
 
  file { 'autosign.conf':
    path    => '/etc/puppet/autosign.conf',
    owner   => 'puppet',
    group   => 'puppet',
    mode    => '0644',
    content => '*',
    require => Package['puppetmaster']
  }

  service { 'puppetmaster':
    enable => true,
    ensure => running,
    require => Package['puppetmaster']
  }

}
