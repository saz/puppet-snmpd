class snmpd::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'snmpd'
      $service_config = '/etc/snmp/snmpd.conf'
      $service_name = 'snmpd'
      $default_config = '/etc/default/snmpd'
    }
  }
}
