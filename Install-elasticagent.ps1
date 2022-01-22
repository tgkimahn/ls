<#
.DESCRIPTION
Install-ElasticAgent downloads the ElasticAgent zip archive and installs its service
#>

[CmdletBinding()]

#Establish parameters for path
param (
    [string]$path=[Environment]::GetFolderPath("Desktop")   
)

#Test path and create it if required

If(!(test-path $path))
{
	Write-Information -MessageData "Path does not exist.  Creating Path..." -InformationAction Continue;
	New-Item -ItemType Directory -Force -Path $path | Out-Null;
	Write-Information -MessageData "...Complete" -InformationAction Continue
}

Set-Location $path

Write-Host "Location set $path"

Write-Host "Retrieving ElasticAgent..."

$downFile = 'https://artifacts.elastic.co/downloads/beats/elastic-agent/elastic-agent-7.16.2-windows-x86_64.zip'
$outFile='elasticagent.zip'

$ProgressPreference = 'SilentlyContinue'
Invoke-WebRequest -Uri $downFile -Outfile $outFile

#(New-Object Net.Webclient).DownloadFile($downFile, $outFile)

Write-Host "ElasticAgent Retrived"

Write-Host "Unzip ElasticAgent..."

Expand-Archive $outFile

Set-Location $path\elasticagent\elastic-agent-7.16.2-windows-x86_64

Write-Host "Unzip Complete."

Write-Host "Installing ElasticAgent throught Fleet..."

.\elastic-agent.exe install --insecure --url=http://10.30.11.219:8220 --enrollment-token=ZWhtNGUzNEItbXZmc1BfR2FjOHc6RXZjRnBJQmxTQldMc0FCdGVnSWcxZw==

Write-Host "ElasticAgent Installed"
#.\elastic-agent.exe install -f  `
#  --fleet-server-es=http://10.30.11.219:9200 `
#  --fleet-server-service-token=AAEAAWVsYXN0aWMvZmxlZXQtc2VydmVyL3Rva2VuLTE2NDI2NjI3ODk1Njk6bk1KY0ZGZGNRcXV1VXdsclNuMjhyZw `
#  --fleet-server-policy=499b5aa7-d214-5b5d-838b-3cd76469844e `
#  --fleet-server-insecure-http
  
