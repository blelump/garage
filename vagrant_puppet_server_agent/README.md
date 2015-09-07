## Overview

This repository provides complete Puppet master--agent environment baked with Vagrant. Puppet master has preinstalled `r10k` and configured `puppet.conf` to play with environments. 

## Usage

* `gem install bundler && bundle install --path vendor`
* `vagrant up`
* `vagrant ssh puppet` and configure [`/etc/r10k.yaml`][1] accordingly.
* `sudo r10k deploy environment`

#### Caveats

* I prefer Vagrant installation in an isolation and therefore using Bundler. Bundler Gemfile's also deals with third party Vagrant plugins since there's no useful plugin manager for Vagrant itself at the time of writing. 
* Gemfile contains `puppet` gem as dependency, because `vagrant-r10k` plugin uses it to deal with dependencies. This is somewhat unfortunate solution, however it seems there's no better (or suitable) approach to provide Puppet modules (yep, I considered e.g. git submodules).  


[1]: https://github.com/puppetlabs/r10k/blob/master/r10k.yaml.example
