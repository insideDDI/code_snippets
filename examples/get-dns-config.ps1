<# Extract MS Server DNS configuration and store into JSON format.

Parameters
----------
directory
    Path for storing all config dumps
hostname:
    Hostname of the current server

Returns
-------
    JSON and txt files with extraction results
#>

Set-Variable directory "dns-config-export"

if ( Test-Path $directory ) {
    rm $directory/*
} else {
    mkdir $directory
}

$commandsList = @(
    "Get-DnsServer",
    "Get-DnsServerClientSubnet",
    "Get-DnsServerDnsSecZoneSetting",
    "Get-DnsServerEDns",
    "Get-DnsServerForwarder",
    "Get-DnsServerGlobalNameZone",
    "Get-DnsServerQueryResolutionPolicy",
    "Get-DnsServerRecursion",
    "Get-DnsServerRecursionScope",
    "Get-DnsServerRootHint",
    "Get-DnsServerSetting",
    "Get-DnsServerTrustAnchor",
    "Get-DnsServerTrustPoint",
    "Get-DnsServerZone",
    "Get-DnsServerZoneDelegation",
    "Get-DnsServerZoneScope",
    "Get-DnsServerZoneTransferPolicy",
    "Get-NetIPAddress",
    "hostname"
    )
# Commented-out section for future expansion
# Get-DnsServerResourceRecord | ConvertTo-Json > $( "$directory\" + "DNS-RR.json" )
# Invoke each command and save output to separate file
foreach ($c in $commandsList) {
    Invoke-Expression $c | ConvertTo-Json > $( "$directory\$c" + ".json" )
    }

dnscmd /info > $( "$directory\" + "dnscmd.txt" )
dnscmd /EnumZones > $( "$directory\" + "enumzones.txt" )

# regedit /e $( "$directory\" + "dns_export.reg" ) "HKEY_LOCAL_Machine\SOFTWARE\Microsoft\Windows\NT\CurrentVersion\DNS Server\Zones"

$zipf = $directory + $( hostname ) + ".zip"

if ( Test-Path $zipf ) {
    rm $zipf
}

# Archive data in zip
Compress-Archive -Path $directory -DestinationPath $zipf

# Cleanup
rm -R $directory

