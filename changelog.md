# Changelog

This project is [semantically versioned](http://semver.org)

## 1.3.1

* Fix file emptiness file name

## 1.3.0

* Add task `snmp_tasks_rhel::file_emptiness_test`

## 1.2.0

* Test file timestamps in one minute precision with
  `snmp_tasks_rhel::file_max_age_minutes`

## 1.1.2

* Fix broken file-max-age test

## 1.1.1

* Use curl instead of wget

  Curl exits with status 0 even though the server would respond 404.

* Print correct ip or hostname when reporting error

## 1.1.0

* Add http_hostname_or_ip param into ::http_smoke_test

## 1.0.1

* Depend on 1-series of llehmijo/snmp_rhel

## 1.0.0

* First release
