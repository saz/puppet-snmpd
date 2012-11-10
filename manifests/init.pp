class snmpd(
  $ro_community = 'public',
  $rw_community = 'private',
  $ro_network = '127.0.0.1',
  $rw_network = '127.0.0.1',
  $location = 'Unknown',
  $contact = 'Unknown'
) inherits snmpd::params {
  package { $snmpd::params::package_name:
    ensure => present,
  }

  file { $snmpd::params::service_config:
    owner   => $snmpd::params::config_owner,
    group   => $snmpd::params::config_group,
    mode    => '0640',
    content => template("snmpd/${snmpd::params::service_config_template}"),
    require => Package[$snmpd::params::package_name],
    notify  => Service[$snmpd::params::service_name],
  }

  if $snmpd::params::default_config {
    file { $snmpd::params::default_config:
      owner   => $snmpd::params::config_owner,
      group   => $snmpd::params::config_group,
      mode    => '0640',
      source  => "puppet:///modules/snmpd/${snmpd::params::default_config_source}",
      require => Package[$snmpd::params::package_name],
      notify  => Service[$snmpd::params::service_name],
    }
  }

  service { $snmpd::params::service_name:
    ensure     => running,
    hasstatus  => false,
    hasrestart => true,
    enable     => true,
    require    => File[$snmpd::params::service_config],
  }
}
