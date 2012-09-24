class snmpd::params {
  case $::osfamily {
    debian: {
      $package_name = 'snmpd'
      $service_config = '/etc/snmp/snmpd.conf'
      $service_config_template = 'debian/snmpd.conf.erb'
      $service_name = 'snmpd'
      $default_config = '/etc/default/snmpd'
      $default_config_source = 'debian/default_snmpd'
    }
    freebsd: {
      $package_name = 'net-mgmt/bsnmp-ucd'
      $service_config = '/etc/snmp/snmpd.conf'
      $service_name = 'bsnmpd'
    }
    default: {
      case $::operatingsystem {
      }
      default: {
        fail("Unsupported platform: ${::osfamily}/${::operatingsystem}")
      }
    }
  }
}
