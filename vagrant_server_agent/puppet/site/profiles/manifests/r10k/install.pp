class profiles::r10k::install {

  class { 'r10k':
    version           => '1.5.1',
    sources           => {
      'puppet' => {
        'remote'  => 'REPO.git',
        'basedir' => "${::settings::confdir}/environments",
        'prefix'  => false,
      }
    },
    manage_modulepath => false,
  }

}
