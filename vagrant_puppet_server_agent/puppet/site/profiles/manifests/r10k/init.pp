class profiles::r10k::init {

  Ini_setting {
    ensure => present,
    path   => "${::settings::confdir}/puppet.conf",
  }

  ini_setting { 'Configure environmentpath':
    section => 'main',
    setting => 'environmentpath',
    value   => '$confdir/environments',
  }

  ini_setting { 'Configure basemodulepath':
    section => 'main',
    setting => 'basemodulepath',
    value   => '$confdir/modules',
  }

}
