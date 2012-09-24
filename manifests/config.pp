class snmpd::config {
  file { $snmpd::params::service_config:
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
    content => template("snmpd/${snmpd::params::service_config_template}"),
    require => Class['snmpd::install'],
    notify  => Class['snmpd::service'],
  }

  if $snmpd::params::default_config {
    file { $snmpd::params::default_config:
      owner   => 'root',
      group   => 'root',
      mode    => '0640',
      source  => "puppet:///modules/snmpd/${snmpd::params::default_config_source}",
      require => Class['snmpd::install'],
      notify  => Class['snmpd::service'],
    }
  }
}
