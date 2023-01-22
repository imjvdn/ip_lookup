$ipAddress = $args[0]
$url = "https://ipinfo.io/$ipAddress/json"
$location = (Invoke-WebRequest -Uri $url).Content | ConvertFrom-Json
Write-Host "City: $($location.city)"
Write-Host "Region: $($location.region)"
Write-Host "Country: $($location.country)"
Write-Host "Latitude: $($location.loc.Split(",")[0])"
Write-Host "Longitude: $($location.loc.Split(",")[1])"
Write-Host "ISP: $($location.org)"
