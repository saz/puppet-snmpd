class snmpd::params {
    case $operatingsystem {
        /(Ubuntu|Debian)/: {
            $package_name = 'snmpd'
            $service_config = '/etc/snmp/snmpd.conf'
            $service_name = 'snmpd'
            $default_config = '/etc/default/snmpd'
        }
    }

    $ro_community = $snmpd_ro_community ? {
        ''      => "public",
        default => $snmpd_ro_community,
    }

    $rw_community = $snmpd_rw_community ? {
        ''      => "private",
        default => $snmpd_rw_community,
    }

    $ro_network = $snmpd_ro_network ? {
        ''      => "127.0.0.1",
        default => $snmpd_ro_network,
    }

    $rw_network = $snmpd_rw_network ? {
        ''      => "127.0.0.1",
        default => $snmpd_rw_network,
    }

    $location = $snmpd_location ? {
        ''      => "Unknown",
        default => $snmpd_location,
    }

    $contact = $snmpd_contact ? {
        ''      => "Unknown",
        default => $snmpd_contact,
    }
}
