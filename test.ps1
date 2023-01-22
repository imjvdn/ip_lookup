$ipAddress = $args[0]
$url = "https://ipinfo.io/$ipAddress/json"
$ipinfo = (Invoke-WebRequest -Uri $url -UseBasicParsing).Content | ConvertFrom-Json

$orgName = $ipinfo.org
$orgId = $ipinfo.asn
$address = $ipinfo.loc
$city = $ipinfo.city
$stateProv = $ipinfo.region
$postalCode = $ipinfo.postal
$country = $ipinfo.country
$regDate = "Not available"
$updated = "Not available"

# output the information
Write-Host "OrgName: $orgName"
Write-Host "OrgId: $orgId"
Write-Host "Address: $address"
Write-Host "City: $city"
Write-Host "StateProv: $stateProv"
Write-Host "PostalCode: $postalCode"
Write-Host "Country: $country"
Write-Host "RegDate: $regDate"
Write-Host "Updated: $updated"
