$ipAddress = $args[0]
if (!([System.Net.IPAddress]::TryParse($ipAddress, [ref]$null))) {
    Write-Host "Invalid IP address format"
    break
}
$url = "https://ipinfo.io/$ipAddress/json"
try {
    $location = (Invoke-WebRequest -Uri $url -ErrorAction Stop).Content | ConvertFrom-Json
    Write-Host "------- IP Info Lookup --------" -ForegroundColor Green
    Write-Host "IP Address:" $ipAddress -ForegroundColor Green
Write-Host "Hostname: $($location.hostname)" -ForegroundColor Green
Write-Host "ISP: $($location.org)" -ForegroundColor Green
Write-Host "City: $($location.city)" -ForegroundColor Green
Write-Host "Region: $($location.region)" -ForegroundColor Green
Write-Host "Country: $($location.country)" -ForegroundColor Green
Write-Host "Latitude: $($location.loc.Split(",")[0])" -ForegroundColor Green
Write-Host "Longitude: $($location.loc.Split(",")[1])"-ForegroundColor Green
Write-Host "Timezone: $($location.timezone)"-ForegroundColor Green
    Write-Host "-------------------------------"-ForegroundColor Green
    Write-Host ""
    Write-Host "--------- System Time ---------"-ForegroundColor Green
    Write-Host "    $(Get-Date -Format "dd MMMM yyyy HH:mm:ss")"-ForegroundColor Green
    Write-Host "-------------------------------"-ForegroundColor Green

    
} catch {
    Write-Host "Error getting location information for IP address $ipAddress" 
}

 