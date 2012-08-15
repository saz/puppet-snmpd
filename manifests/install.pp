class snmpd::install {
  package { $snmpd::params::package_name:
    ensure => present,
  }
}
