class profiles::network::base { 
  
  host { 'puppet':
    name => "puppet.example.com",
    ip => "172.16.32.10",
    host_aliases => "puppet"
  }

  host { 'client1':
    name => "client1.example.com",
    ip => "172.16.32.11",
    host_aliases => "client1"
  }
}
