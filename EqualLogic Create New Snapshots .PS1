### EqualLogic Powershell - Set existing snapshots offline for all volumes, create new snapshots on all volumes

Connect-EqlGroup -GroupAddress 0.0.0.0 -Credential (Get-Credential -Credential USERNAME)
Get-EqlVolume | Get-EqlSnapshot | Set-EqlSnapshot -OnlineStatus offline
Get-EqlVolume | New-EqlSnapshot -OnlineStatus online -AccessType read_only
Disconnect-EqlGroup

Get-IscsiTargetPortal | Update-IscsiTargetPortal

Get-IscsiTarget | Connect-IscsiTarget -IsMultipathEnabled:$true
start-sleep -s 10
get-disk | Set-Disk -IsOffline $False
