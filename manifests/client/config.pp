class ssh::client::config {
  
  if ($::osfamily != Darwin) {
    file { $ssh::params::ssh_config:
      ensure  => present,
      owner   => 'root',
      group   => 'root',
      source  => "puppet:///modules/${module_name}/ssh_config",
      require => Class['ssh::client::install'],
    }
  }

  if ($::osfamily == Darwin) {
    file { $ssh::params::ssh_config:
      ensure  => present,
      owner   => 'root',
      group   => 'wheel',
      source  => "puppet:///modules/${module_name}/ssh_config_darwin",
    }
  }

  # Workaround for http://projects.reductivelabs.com/issues/2014
  file { $ssh::params::ssh_known_hosts:
    mode => '0644',
  }
}
