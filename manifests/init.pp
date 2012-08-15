class snmpd(
  $ro_community = 'public',
  $rw_community = 'private',
  $ro_network = '127.0.0.1',
  $rw_network = '127.0.0.1',
  $location = 'Unknown',
  $contact = 'Unknown'
) {
    include snmpd::params
    include snmpd::install
    include snmpd::config
    include snmpd::service
}
