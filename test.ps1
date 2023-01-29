$ipAddress = $args[0]
if (!([System.Net.IPAddress]::TryParse($ipAddress, [ref]$null))) {
    Write-Host "Invalid IP address format"
    break
}
$url = "https://ipinfo.io/$ipAddress/json"
try {
    $location = (Invoke-WebRequest -Uri $url -ErrorAction Stop).Content | ConvertFrom-Json

    
    $location | Format-Table -AutoSize -Wrap -Property @{Label="IP Address";Expression={$ipAddress}}, hostname, org, city, region, country, @{Label="Latitude";Expression={$location.loc.Split(",")[0]}}, @{Label="Longitude";Expression={$location.loc.Split(",")[1]}}, timezone

} catch {
    Write-Host "Error getting location information for IP address $ipAddress" 
}
