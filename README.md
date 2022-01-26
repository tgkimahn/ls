# ls prep.
Implement endpoint security system with sysmon/winlogbeat/elasticagent under elasticsearch and kinana
 - Set-Item WSMan:\localhost\Client\TrustedHosts –Value {* or targetip}
 - Run ' Invoke-Command -ScriptBlock {`
	Set-ExecutionPolicy Bypass -Scope Process -Force;`
	iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/tgkimahn/ls/master/Install-{changeit}.ps1'))`
	}'

Build up the baseline security

 change password in a batch
 deny local logon such as rdp
 deny id/pw logon, instead use only ssh key logon 
 depoly seuciryt hardening GPO
  - disable local logon
  - disable rdp etc
 run windows file protection
 inspect startup across Windows
 install SIEM such as ELK stack
 install anti-virus, beats etc (to gather endpoint events)
