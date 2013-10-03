node 'sensu.example.com' {
  class { 'erlang':
    epel_enable => true,
  }->
  package { 'redis':
    ensure => 'installed',
  }->
  service { 'redis':
    ensure => 'running',
    enable => true,
  }->
  class { 'rabbitmq':
    erlang_manage  => false,
    service_manage => true,
    admin_enable   => true,
    port           => '5671',
  }->
  rabbitmq_user { 'sensu':
    admin    => true,
    password => 'secret',
  }->
  rabbitmq_vhost { '/sensu':
    ensure => present,
  }->
  rabbitmq_user_permissions { 'sensu@/sensu':
    configure_permission => '.*',
    read_permission      => '.*',
    write_permission     => '.*',
  }->
  class { 'sensu':
    rabbitmq_password => 'secret',
    server            => true,
    use_embedded_ruby     => true,
  }
}