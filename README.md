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

The above snippet creates a Bash script
`/opt/monitoring-tasks/my-web-app-http_smoke_test.sh`.
Furthermore, it will add the script into `/etc/snmp/snmpd.conf` and restart
`Service['net-snmp']`.

By default, the smoke test will hit `localhost`. You can change the host by
adding the parameter `http_hostname_or_ip`.

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

The above snippet creates a Bash script that will exit with code 1 if the file
`/opt/logs/cron-job-timestamp` is more than one days old. Before exit, it will
print the `error_message`.

You can also monitor files with one minute precision:

    snmp_tasks_rhel::file_max_age_minutes { "cron-job-monitor":
      file_to_test         => "/opt/logs/cron-job-timestamp",
      max_age_in_minutes   => 5,
      error_message        => "Cronjob has not run within 5 minutes",
      tasks_home_directory => "/opt/monitoring-tasks"
    }

## Dependencies

This Puppet module depends on
[llehmijo/snmp_rhel](https://github.com/laurilehmijoki/snmp_rhel).

## Links

This project in Puppet Forge:
<http://forge.puppetlabs.com/llehmijo/snmp_tasks_rhel>.

## License

MIT
