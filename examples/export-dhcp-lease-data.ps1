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

Set-Variable directory "dhcp-config-export"

if ( Test-Path $directory ) {
    rm $directory/* -Recurse
} else {
    mkdir $directory
}
echo $version > $( "$directory\" + "OS.txt" )

# Export all DHCP scopes to a text file
Get-DhcpServerv4Scope -ComputerName "localhost" | Get-DhcpServerv4Lease -ComputerName "localhost" | ConvertTo-Json > ( "$directory\" + "dhcp-leases.json")
Get-DhcpServerv4Scope -ComputerName "localhost" | ConvertTo-Json > ( "$directory\" + "dhcp-scopes.json")
Get-DhcpServerv4OptionDefinition -ComputerName "localhost" -All | ConvertTo-Json > ( "$directory\" + "dhcp-options.json")
netsh dhcp server dump > ( "$directory\" + "dhcp-config.txt")

$zipf = "$directory-$( hostname ).zip"

if ( Test-Path $zipf ) {
    rm $zipf
}

# Archive data in zip
Compress-Archive -Path $directory -DestinationPath $zipf

# Cleanup
rm -R $directory

