### Overview

The underlying idea is to test any CM tool in isolated, predefined environment, where new sandbox spawns fast. Having prepared Docker image, environment is ready in a matter of seconds.

### Usage

* `vagrant up`
* `ansible-playbook -i hosts site.yml`

If you want to play with it, `vagrant ssh` to VM and `cd kitchen-ansible/integration_test/`. Then run `bundle exec kitchen test`. You might add `-d never` param to examine Docker container, because by default it cleans it up.

### Caveats

Docker image is built with sudo to simplify things. It's all installed under vagrant user and because currently with Ansible there's no simple way to 'reload' SSH connection and get session with vagrant user assigned to docker group. This topic is well covered [here][1]. For any non–demo environment you'll have it configured under whatever non–deployment user.

[1]: https://github.com/ansible/ansible-modules-core/issues/921
