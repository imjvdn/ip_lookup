$ipAddress = $args[0]
if (!([System.Net.IPAddress]::TryParse($ipAddress, [ref]$null))) {
    Write-Host "Invalid IP address format"
    break
}
$url = "https://ipinfo.io/$ipAddress/json"
try {
    $location = (Invoke-WebRequest -Uri $url -ErrorAction Stop).Content | ConvertFrom-Json
    Write-Host "ISP: $($location.org)"
    Write-Host "City: $($location.city)"
    Write-Host "Region: $($location.region)"
    Write-Host "Country: $($location.country)"
    Write-Host "Latitude: $($location.loc.Split(",")[0])"
    Write-Host "Longitude: $($location.loc.Split(",")[1])"
} catch {
    Write-Host "Error getting location information for IP address $ipAddress"
}
