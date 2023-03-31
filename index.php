<?php
/**
 * Small abstraction over IP2Location and MaxMind GeoIP
 * use the appropiate function you prefer.
 */
require __DIR__ . '/vendor/autoload.php';

function ip2loc($ip) {
    $idx = strpos($ip, ",");
    if ($idx !== false) {
        $ip = substr($ip, 0, $idx);
    }

    $f = "/usr/local/share/GeoIP/IP2LOCATION-LITE-DB11.BIN";
    if (! filter_var($ip, FILTER_VALIDATE_IP, FILTER_FLAG_IPV4)) {
        // IPv6
        $f = "/usr/local/share/GeoIP/IP2LOCATION-LITE-DB11.IPV6.BIN";
    }
    $db = new \IP2Location\Database($f, \IP2Location\Database::FILE_IO);
    $records = $db->lookup($ip, \IP2Location\Database::ALL);

    if ($records["cityName"] === \IP2Location\Database::INVALID_IP_ADDRESS) {
        $records['ipAddress'] = $ip;
        $records['ipVersion'] = "";
        $records['countryCode'] = "";
        $records['cityName'] = "";
        $records['latitude'] = "";
        $records['longitude'] = "";
    }

    return [
        "ip" => $records['ipAddress'],
        "ipv" => $records['ipVersion'],
        "iso2" => $records['countryCode'],
        "city" => $records['cityName'],
        "lat" => $records['latitude'],
        "long" => $records['longitude']
    ];
}

function maxmind($ip) {
    $idx = strpos($ip, ",");
    if ($idx !== false) {
        $ip = substr($ip, 0, $idx);
    }

    $reader = new \GeoIp2\Database\Reader('/usr/local/share/GeoIP/city.mmdb');
    $record = $reader->city($ip);

    return [
        "ip" => $ip,
        "ipv" => filter_var($ip, FILTER_VALIDATE_IP, FILTER_FLAG_IPV4) ? 4 : 6,
        "iso2" => $record->country->isoCode,
        "city" => $record->city->name,
        "lat" => $record->location->latitude,
        "long" => $record->location->longitude
    ];
}
function maxmind_asn($ip) {
    $idx = strpos($ip, ",");
    if ($idx !== false) {
        $ip = substr($ip, 0, $idx);
    }

    $reader = new \GeoIp2\Database\Reader('/usr/local/share/GeoIP/asn.mmdb');
    $record = $reader->asn($ip);

    return [
        "asn" => $record->autonomousSystemNumber,
        "company" => $record->autonomousSystemOrganization
    ];
}
