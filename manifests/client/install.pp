class ssh::client::install {
  if ($::osfamily != Darwin) {
    package { $ssh::params::client_package_name:
      ensure => latest,
    }
  }
}
