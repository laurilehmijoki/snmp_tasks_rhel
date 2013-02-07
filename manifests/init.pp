define snmp_tasks::http_smoke_test(
  $application = $title,
  $http_port,
  $tasks_home_directory,
  $smoke_test_path = '/') {

  package { "wget":
    ensure => installed
  }

  $file_path = "$tasks_home_directory/$application-http_smoke_test.sh"

  file { $file_path:
    content => template("snmp_tasks/http_smoke_test.sh.erb"),
    path    => $file_path,
    mode    => "0750"
  }

  snmp_rhel::snmpd_exec { $application:
    command => $file_path
  }
}
