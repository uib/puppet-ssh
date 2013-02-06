class ssh::client {
  include ssh::params
  include ssh::client::install
  include ssh::client::config
  
  if $ssh::enable_hostkeys == true {
    include ssh::knownhosts
  }

}
