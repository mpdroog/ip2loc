GeoIP lookup
=============
Generic PHP-codebase to easily switch between MaxMind/IP2Location.

Lightweight codebase for MaxMind and IP2Location.
- No composer/autoload for MaxMind (phar+binfile)
- IP2Location without autoload/mysql (binfile)

Example
```php
<?php
require "path/to/this/repo/index.php";
echo "<pre>";
$res = ip2loc($_SERVER["REMOTE_ADDR"]);
var_dump($res);

/*
array(6) {
  ["ip"]=>
  string(14) "94.232.119.106"
  ["ipv"]=>
  int(4)
  ["iso2"]=>
  string(2) "SM"
  ["city"]=>
  string(10) "San Marino"
  ["lat"]=>
  float(43.933330535889)
  ["long"]=>
  float(12.449999809265)
}
*/

$res = maxmind($_SERVER["REMOTE_ADDR"]);
var_dump($res);

/*
array(6) {
  ["ip"]=>
  string(14) "94.232.119.106"
  ["ipv"]=>
  int(4)
  ["iso2"]=>
  string(2) "SM"
  ["city"]=>
  NULL
  ["lat"]=>
  float(43.9333)
  ["long"]=>
  float(12.4667)
}
*/
```

Install
```bash
# TODO: Composer: https://getcomposer.org/download/
mkdir -p /usr/local/share/GeoIP
chown www-data:www-data /usr/local/share/GeoIP
wget https://github.com/maxmind/GeoIP2-php/releases/download/v2.7.0/geoip2.phar
./composer.phar install
# Fix permissions
./perm.sh

vi /etc/cron.d/geoip
...
@daily www-data /data01/xsnews/ip2loc/update.sh
...

/etc/init.d/cron restart
```
