GeoIP lookup
=============
Generic PHP-codebase to easily switch between MaxMind/IP2Location.

Lightweight codebase for MaxMind and IP2Location.
- No composer/autoload for MaxMind
- IP2Location without autoload/mysql (binfile)

Example in
```
<?php
require "path/to/this/repo/index.php";
echo "<pre>";
$res = ip2loc($_SERVER["HTTP_X_FORWARDED_FOR"]);
var_dump($res);

$res = maxmind($_SERVER["HTTP_X_FORWARDED_FOR"]);
var_dump($res);
```

Example out
```
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
```


MaxMind
```
wget https://github.com/maxmind/GeoIP2-php/releases/download/v2.7.0/geoip2.phar
```

IP2Location
```
composer install
```

/etc/cron.d/geoip
```
# GeoIP
0 12 * * * root rm /usr/local/share/GeoIP/GeoLite2-City.mmdb; wget http://geolite.maxmind.com/download/geoip/database/GeoLite2-City.mmdb.gz -P /usr/local/share/GeoIP; gzip -d /usr/local/share/GeoIP/GeoLite2-City.mmdb.gz
0 12 * * * root rm /usr/local/share/GeoIP/GeoLite2-Country.mmdb; wget http://geolite.maxmind.com/download/geoip/database/GeoLite2-Country.mmdb.gz -P /usr/local/share/GeoIP; gzip -d /usr/local/share/GeoIP/GeoLite2-Country.mmdb.gz

# IP2Loc
0 12 * * * root wget -q "http://www.ip2location.com/download/?token=0TZdN4zFJFYvV1crcKnodfdRZPG5C5eDZdRMiqr16qx1rKtEuQ2H6gy65fcIkqmk&file=DB11LITEBIN" -O /usr/local/share/GeoIP/ip2loc.zip && cd /usr/local/share/GeoIP && unzip -o -q ip2loc.zip
0 12 * * * root wget -q "http://www.ip2location.com/download/?token=0TZdN4zFJFYvV1crcKnodfdRZPG5C5eDZdRMiqr16qx1rKtEuQ2H6gy65fcIkqmk&file=DB11LITEBINIPV6" -O /usr/local/share/GeoIP/ip2loc.zip && cd /usr/local/share/GeoIP && unzip -o -q ip2loc.zip
```
