class ssh::server::service {
  include ssh::params
  include ssh::server
  if ($::osfamily != Darwin) {
    service { $ssh::params::service_name:
      ensure     => running,
      hasstatus  => true,
      hasrestart => true,
      enable     => true,
      require    => Class['ssh::server::config'],
    }
  }
}
