class ssh(
  $enable_hostkeys = $ssh::params::enable_hostkeys
) inherits ssh::params {

  include ssh::server
  include ssh::client
}
