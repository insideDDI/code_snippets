# Extract MS Server DNS configuration and store into JSON format

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

foreach ($c in $commandsList) {
    Invoke-Expression $c | ConvertTo-Json > $( "$directory\$c" + ".json" )
    }

dnscmd /info "$directory\" + "dnscmd.info"

$zipf = $directory + $( hostname ) + ".zip"

if ( Test-Path $zipf ) {
    rm $zipf
}

Compress-Archive -Path $directory -DestinationPath $zipf
# Get-DnsServerResourceRecord