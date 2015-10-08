FROM ubuntu:trusty

RUN dpkg-divert --local --rename --add /sbin/initctl
RUN ln -sf /bin/true /sbin/initctl

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get install -y sudo openssh-server curl lsb-release

RUN if ! getent passwd _USERNAME_; then \
  useradd -d _HOMEDIR_ -m -s /bin/bash _USERNAME_; \
fi

RUN echo _USERNAME_:_PASSWORD_ | chpasswd
RUN echo '_USERNAME_ ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
RUN mkdir -p /etc/sudoers.d
RUN echo '_USERNAME_ ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers.d/_USERNAME_
RUN chmod 0440 /etc/sudoers.d/_USERNAME_
RUN mkdir -p _HOMEDIR_/.ssh
RUN chown -R _USERNAME_ _HOMEDIR_/.ssh
RUN chmod 0700 _HOMEDIR_/.ssh
RUN touch _HOMEDIR_/.ssh/authorized_keys
RUN chown _USERNAME_ _HOMEDIR_/.ssh/authorized_keys
RUN chmod 0600 _HOMEDIR_/.ssh/authorized_keys
ADD .kitchen/docker_id_rsa.pub _HOMEDIR_/.ssh/
RUN cat _HOMEDIR_/.ssh/docker_id_rsa.pub >> _HOMEDIR_/.ssh/authorized_keys
RUN rm _HOMEDIR_/.ssh/docker_id_rsa.pub

RUN apt-get install -y software-properties-common
RUN apt-add-repository ppa:ansible/ansible
RUN apt-get update
RUN apt-get install -y git curl ansible ssh

RUN apt-get install -y ruby

RUN mkdir -p /tmp/verifier/bin && gem install --no-rdoc --no-ri --no-format-executable -n /tmp/verifier/bin -i /tmp/verifier/gems busser busser-serverspec serverspec
RUN chown -R _USERNAME_:_USERNAME_ /tmp/verifier/

CMD ["/bin/bash"]

