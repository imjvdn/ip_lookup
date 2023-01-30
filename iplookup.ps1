$ipAddress = $args[0]
if (!([System.Net.IPAddress]::TryParse($ipAddress, [ref]$null))) {
    Write-Host "Invalid IP address format"
    break
}
$url = "https://ipinfo.io/$ipAddress/json"
try {
    $location = (Invoke-WebRequest -Uri $url -ErrorAction Stop).Content | ConvertFrom-Json
    Write-Host "------- IP Info Lookup --------" -ForegroundColor Cyan
    Write-Host "IP Address:" $ipAddress -ForegroundColor Cyan
Write-Host "Hostname: $($location.hostname)" -ForegroundColor Cyan
Write-Host "ISP: $($location.org)" -ForegroundColor Cyan
Write-Host "City: $($location.city)" -ForegroundColor Cyan
Write-Host "Region: $($location.region)" -ForegroundColor Cyan
Write-Host "Country: $($location.country)" -ForegroundColor Cyan
Write-Host "Latitude: $($location.loc.Split(",")[0])" -ForegroundColor Cyan
Write-Host "Longitude: $($location.loc.Split(",")[1])"-ForegroundColor Cyan
Write-Host "Timezone: $($location.timezone)"-ForegroundColor Cyan
    Write-Host "-------------------------------"-ForegroundColor Cyan
    Write-Host ""
    Write-Host "--------- System Time ---------"-ForegroundColor Cyan
    Write-Host "    $(Get-Date -Format "dd MMMM yyyy HH:mm:ss")"-ForegroundColor Cyan
    Write-Host "-------------------------------"-ForegroundColor Cyan

    
} catch {
    Write-Host "Error getting location information for IP address $ipAddress" 
}

 