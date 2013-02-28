# Changelog

This project is [semantically versioned](http://semver.org)

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
