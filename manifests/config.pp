class snmpd::config {
    file { $snmpd::params::service_config:
        owner   => root,
        group   => root,
        mode    => 640,
        content => template("snmpd/snmpd.conf.erb"),
        require => Class["snmpd::install"],
        notify  => Class["snmpd::service"],
    }

    file { $snmpd::params::default_config:
        owner   => root,
        group   => root,
        mode    => 640,
        source  => "puppet:///modules/snmpd/default_snmpd",
        require => Class["snmpd::install"],
        notify  => Class["snmpd::service"],
    }
}
