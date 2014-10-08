Connect-EqlGroup -GroupAddress 0.0.0.0 -Credential (Get-Credential -Credential USERNAME)
Get-EqlVolume | Get-EqlSnapshot | Set-EqlSnapshot -OnlineStatus offline
Get-EqlVolume | New-EqlSnapshot -OnlineStatus online -AccessType read_only
Disconnect-EqlGroup
