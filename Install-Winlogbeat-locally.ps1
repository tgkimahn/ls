<#
.DESCRIPTION
Install-Winlogbeat downloads the Winlogbeat zip archive and installs its service
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

Write-Host "Retrieving winlogbeat..."

Invoke-WebRequest -Uri https://artifacts.elastic.co/downloads/beats/winlogbeat/winlogbeat-7.16.3-windows-x86_64.zip -Outfile winlogbeat.zip

Write-Host "winlogbeat Retrived"

Write-Host "Unzip winlogbeat..."

Expand-Archive winlogbeat.zip

Set-Location $path\winlogbeat\winlogbeat-7.16.3-windows-x86_64

Write-Host "Unzip Complete."

Write-Host "Installing winlogbeat..."

Set-ExecutionPolicy Bypass -Scope Process -Force

.\install-service-winlogbeat.ps1

Write-Host "winlogbeat Installed!"

Write-Host "Retrieving Configuration File from my google drive..."

Invoke-WebRequest -Uri https://raw.githubusercontent.com/tgkimahn/ls/master/winlogbeat.yml -Outfile winlogbeat.yml

Write-Host "Configuration File Retrieved."

Write-Host "Set up assests for elasticsearch and kibana."

.\winlogbeat.exe setup -e

Write-Host "Start winlogbeat service"

Start-Service winlogbeat

Write-Host "Windows logs is coming in soon..."
