class profiles::common {

  include profiles::network::base

  include profiles::ssh::server

  include profiles::firewall::setup

  package {['vim','sudo', 'tree', 'htop']:
    ensure => present,
  }
}
