class snmpd::service {
    service { $snmpd::params::service_name:
        ensure     => running,
        hasstatus  => false,
        hasrestart => true,
        enable     => true,
        require    => Class["snmpd::install"],
    }
}
