# SNMP tasks Puppet Forge module for RHEL

## Features

* Add an HTTP smoke test into `/etc/snmp/snmpd.conf`
* Add a file-max-age test into `/etc/snmp/snmpd.conf`

## Install

    puppet module install llehmijo/snmp_tasks_rhel

## Usage

### Monitoring HTTP services

    # In site.pp
    node "superserver" {
      # Add smoke test task for an HTTP application
      snmp_tasks_rhel::http_smoke_test { "my-web-app":
        http_port            => 80,
        smoke_test_path      => "/",
        tasks_home_directory => "/opt/monitoring-tasks"
      }
    }

The above snippet create a Bash script
`/opt/monitoring-tasks/my-web-app-http_smoke_test.sh`.
Furthermore, it will add the script into `/etc/snmp/snmpd.conf`.

### Monitoring file timestamps

    # In site.pp
    node "superserver" {
      snmp_tasks_rhel::file_max_age { "cron-job-monitor":
        file_to_test         => "/opt/logs/cron-job-timestamp",
        max_age_in_days      => 1,
        error_message        => "Cronjob has not run within 1 days",
        tasks_home_directory => "/opt/monitoring-tasks"
      }
    }

## Dependencies

This Puppet module depends on
[llehmijo/snmp_rhel](https://github.com/laurilehmijoki/snmp_rhel).

## Links

This project in Puppet Forge:
<http://forge.puppetlabs.com/llehmijo/snmp_tasks_rhel>.

## License

MIT