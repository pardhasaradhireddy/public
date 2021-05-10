# Define clear text string for username and password
#[string]$userName = 'dmiuser'
#[string]$userPassword = 'dmiuser@2021'
#[string]$domainname = 'corp.testdomain.com'


[CmdletBinding()]
param(
  [Parameter(Mandatory=$true)]
  [String]$domainuserName,

  [String]$domainPassword,

  [Parameter(Mandatory=$true)]
  [String]$domainname

)


# Convert to SecureString
[securestring]$secStringPassword = ConvertTo-SecureString $domainPassword -AsPlainText -Force

[pscredential]$credObject = New-Object System.Management.Automation.PSCredential ($domainuserName, $secStringPassword)

Add-Computer -DomainName $domainname -Credential $credObject