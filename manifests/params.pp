class ssh::params {

  $enable_hostkeys = false
  
  case $::osfamily {
    debian: {
      $server_package_name = 'openssh-server'
      $client_package_name = 'openssh-client'
      $sshd_config = '/etc/ssh/sshd_config'
      $ssh_config = '/etc/ssh/ssh_config'
      $ssh_known_hosts = '/etc/ssh/ssh_known_hosts'
      $service_name = 'ssh'
    }
    redhat: {
      $server_package_name = 'openssh-server'
      $client_package_name = 'openssh-clients'
      $sshd_config = '/etc/ssh/sshd_config'
      $ssh_config = '/etc/ssh/ssh_config'
      $ssh_known_hosts = '/etc/ssh/ssh_known_hosts'
      $service_name = 'sshd'
    }
    Darwin: {
      $sshd_config = '/etc/sshd_config'
      $ssh_config = '/etc/ssh_config'
      $ssh_known_hosts = '/etc/ssh_known_hosts'
    }
    default: {
      case $::operatingsystem {
        default: {
          fail("Unsupported platform: ${::osfamily}/${::operatingsystem}")
        }
      }
    }
  }
}
