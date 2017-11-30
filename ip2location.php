<?php
require 'vendor/autoload.php';
$f = "/usr/local/share/GeoIP/IP2LOCATION-LITE-DB11.BIN";
if (! filter_var($ip, FILTER_VALIDATE_IP, FILTER_FLAG_IPV4)) {
    // IPv6
    $f = "/usr/local/share/GeoIP/IP2LOCATION-LITE-DB11.IPV6.BIN";
}

$db = new \IP2Location\Database($f, \IP2Location\Database::FILE_IO);
$ip = $_SERVER["HTTP_X_FORWARDED_FOR"];
$records = $db->lookup($ip, \IP2Location\Database::ALL);

echo 'Input IP=' . $ip . "\n";
echo '<pre>';
echo 'IP Number             : ' . $records['ipNumber'] . "\n";
echo 'IP Version            : ' . $records['ipVersion'] . "\n";
echo 'IP Address            : ' . $records['ipAddress'] . "\n";
echo 'Country Code          : ' . $records['countryCode'] . "\n";
echo 'Country Name          : ' . $records['countryName'] . "\n";
echo 'Region Name           : ' . $records['regionName'] . "\n";
echo 'City Name             : ' . $records['cityName'] . "\n";
echo 'Latitude              : ' . $records['latitude'] . "\n";
echo 'Longitude             : ' . $records['longitude'] . "\n";
echo 'Area Code             : ' . $records['areaCode'] . "\n";
echo 'IDD Code              : ' . $records['iddCode'] . "\n";
echo 'Weather Station Code  : ' . $records['weatherStationCode'] . "\n";
echo 'Weather Station Name  : ' . $records['weatherStationName'] . "\n";
echo 'MCC                   : ' . $records['mcc'] . "\n";
echo 'MNC                   : ' . $records['mnc'] . "\n";
echo 'Mobile Carrier        : ' . $records['mobileCarrierName'] . "\n";
echo 'Usage Type            : ' . $records['usageType'] . "\n";
echo 'Elevation             : ' . $records['elevation'] . "\n";
echo 'Net Speed             : ' . $records['netSpeed'] . "\n";
echo 'Time Zone             : ' . $records['timeZone'] . "\n";
echo 'ZIP Code              : ' . $records['zipCode'] . "\n";
echo 'Domain Name           : ' . $records['domainName'] . "\n";
echo 'ISP Name              : ' . $records['isp'] . "\n";
echo '</pre>';
