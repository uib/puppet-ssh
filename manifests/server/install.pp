class ssh::server::install {
  include ssh::params
  if ($::osfamily != Darwin) {
    package { $ssh::params::server_package_name:
      ensure => present,
    }
  }
}
