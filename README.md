# ls prep.
Implement endpoint security system with sysmon/winlogbeat/elasticagent under elasticsearch and kinana
 - Set-Item WSMan:\localhost\Client\TrustedHosts –Value {* or targetip}
 - Run ' Invoke-Command -ScriptBlock {`
	Set-ExecutionPolicy Bypass -Scope Process -Force;`
	iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/tgkimahn/ls/master/Install-{changeit}.ps1'))`
	}'

Build up the baseline security

 1. change password in a batch
 2. deny local logon such as rdp
 3. deny id/pw logon, instead use only ssh key logon 
 4. depoly seuciryt hardening GPO
  - disable local logon
  - disable rdp etc
 5. run windows file protection
 6. disable sticky key(5-times shift) & ease of access button (by GPO?)
 7. inspect startup across Windows
 8. install SIEM such as ELK stack
 9. install anti-virus, beats etc (to gather endpoint events) => elasticagent
