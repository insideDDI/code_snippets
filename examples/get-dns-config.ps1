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

# Identify OS version
$version = $( Get-ComputerInfo | select WindowsProductName ).WindowsProductName

Set-Variable directory "dns-config-export"

if ( Test-Path $directory ) {
    rm $directory/* -Recurse
} else {
    mkdir $directory
}

echo $version > $( "$directory\" + "OS.txt" )

# Export all zones' DNS records to a text file
$temp_directory = "dns-config-export-$( hostname )-$(New-GUID)"
echo "Creating temporary directory $temp_directory"
mkdir "C:\windows\system32\dns\$temp_directory"

$zones = Get-DnsServerZone `
    | Where-Object { $_.ZoneType -eq "Primary" } `
    | Where-Object { $_.IsAutoCreated -eq $false } `
    | Where-Object { $_.ZoneName -ne "TrustAnchors" }
foreach ($zone in $zones)
{
    echo "Exporting zone $($Zone.ZoneName)"
    Export-DnsServerZone -Name $Zone.ZoneName -FileName "$temp_directory\$($Zone.ZoneName).txt"
}
echo "Moving temporary directory to $directory"
mv "C:\windows\system32\dns\$temp_directory" $directory

# Define list of commands depending on OS version
# Older OS versions do not support full list of commands
$versions_full = @("2022","2019","2016")
$legacy_os = $($null -ne $($versions_full | Where-Object {$version.Contains($_)}))
if ($legacy_os) {
    $commandsList = @(
    "Get-DnsServer",
    "Get-DnsServerClientSubnet",
    "Get-DnsServerEDns",
    "Get-DnsServerForwarder",
    "Get-DnsServerGlobalNameZone",
    "Get-DnsServerQueryResolutionPolicy",
    "Get-DnsServerRecursion",
    "Get-DnsServerRecursionScope",
    "Get-DnsServerRootHint",
    "Get-DnsServerSetting",
    "Get-DnsServerZone",
    "Get-DnsServerZoneTransferPolicy",
    "Get-NetIPAddress",
    "hostname"
    )
    echo "Current OS detected, using extended commands"
} else {
        $commandsList = @(
    "Get-DnsServer",
    "Get-DnsServerForwarder",
    "Get-DnsServerGlobalNameZone",
    "Get-DnsServerRecursion",
    "Get-DnsServerRecursionScope",
    "Get-DnsServerRootHint",
    "Get-DnsServerSetting",
    "Get-DnsServerZone",
    "Get-DnsServerZoneTransferPolicy",
    "Get-NetIPAddress",
    "hostname"
    )
    echo "Legacy OS detected, using legacy commands"
}
# Commented-out section for future expansion
# Invoke each command and save output to separate file
foreach ($c in $commandsList)
{
    if ($legacy_os)
    {
        Invoke-Expression $c > $( "$directory\$c" + ".txt" )
    }
    else
    {
        Invoke-Expression $c | ConvertTo-Json > $( "$directory\$c" + ".json" )
    }
}

dnscmd /info > $( "$directory\" + "dnscmd.txt" )
dnscmd /EnumZones > $( "$directory\" + "enumzones.txt" )

# regedit /e $( "$directory\" + "dns_export.reg" ) "HKEY_LOCAL_Machine\SOFTWARE\Microsoft\Windows\NT\CurrentVersion\DNS Server\Zones"


$zipf = "$directory-$( hostname ).zip"

if ( Test-Path $zipf ) {
    rm $zipf
}


# Archive data in zip
Compress-Archive -Path $directory -DestinationPath $zipf

# Cleanup
rm -R $directory

