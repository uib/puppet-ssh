class ssh::server::config {
  if ($::osfamily != Darwin) {
    file { $ssh::params::sshd_config:
      ensure  => present,
      owner   => 'root',
      group   => 'root',
      mode    => '0600',
      replace => true,
      source  => "puppet:///modules/${module_name}/sshd_config",
      require => Class['ssh::server::install'],
      notify  => Class['ssh::server::service'],
    }
  }

  if ($::osfamily != Darwin) {
    file { $ssh::params::sshd_config:
      ensure  => present,
      owner   => 'root',
      group   => 'wheel',
      mode    => '0644',
      replace => true,
      source  => "puppet:///modules/${module_name}/sshd_config_darwin",
    }
  }
}
