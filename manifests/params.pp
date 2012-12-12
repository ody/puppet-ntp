class ntp::params {
  # Common

  case $::osfamily {
    'Debian': {
      $package = 'ntp'
      $config_file        = '/etc/ntp.conf'
      $service_name       = 'ntp'
      $driftfile          = '/var/lib/ntp/ntp.drift'
      $config_file_owner  = 'root'
      $config_file_group  = 'root'
      $config_file_mode   = '0644'
      $defaults_file      = '/etc/default/ntp'
      $defaults_file_tpl  = 'ntp.defaults.debian.erb'
      $ntpd_start_options = '-g'
    }
    'RedHat': {
      $package = 'ntp'
      $config_file        = '/etc/ntp.conf'
      $service_name       = 'ntpd'
      $driftfile          = '/var/lib/ntp/drift'
      $config_file_owner  = 'root'
      $config_file_group  = 'root'
      $config_file_mode   = '0644'
      $defaults_file      = '/etc/sysconfig/ntpd'
      $defaults_file_tpl  = 'ntp.defaults.redhat.erb'
      $ntpd_start_options = '-u ntp:ntp -p /var/run/ntpd.pid -g'
    }
    'Suse': {
      $package = 'ntp'
      $config_file       = '/etc/ntp.conf'
      $service_name      = 'ntp'
      $driftfile         = '/var/lib/ntp/drift/ntp.drift'
      $config_file_owner = 'root'
      $config_file_group = 'ntp'
      $config_file_mode  = '0640'
    }
    'FreeBSD': {
      $config_file       = '/etc/ntp.conf'
      $service_name      = 'ntpd'
      $driftfile         = '/var/db/ntpd.drift'
      $config_file_owner = 'root'
      $config_file_group = 'wheel'
      $config_file_mode  = '0640'
    }
    'Darwin': {
      $config_file       = '/etc/ntp.conf'
      $service_name      = 'org.ntp.ntpd'
      $driftfile         = '/var/db/ntpd.drift'
      $config_file_owner = 'root'
      $config_file_group = 'wheel'
      $config_file_mode  = '0644'
    }
    default: {
      fail("Unsupported platform: ${::osfamily}")
    }
  }
}
