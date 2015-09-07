class roles::puppet_server {

  include profiles::puppet_server::base
  include profiles::r10k::install
  include profiles::r10k::init

}
