### EqualLogic Powershell - Set existing snapshots offline for all volumes, create new snapshots on all volumes

### Disconnect all ISCSI connections (optional)
get-disk -FriendlyName *eql* | Set-Disk -IsOffline $True -verbose
Get-IscsiTarget | Disconnect-IscsiTarget -Confirm:$false -verbose
### Connect to EqualLogic
Connect-EqlGroup -GroupAddress 0.0.0.0 -Credential (Get-Credential -Credential USERNAME)
### Set all EqualLogic Snapshots Offline
Get-EqlVolume | Get-EqlSnapshot | Set-EqlSnapshot -OnlineStatus offline
### Create new Snapshots
Get-EqlVolume | New-EqlSnapshot -OnlineStatus online -AccessType read_only
Disconnect-EqlGroup
### Connect to new Snapshots
Get-IscsiTarget | connect-IscsiTarget -verbose
### Set all disks to online
get-disk | Set-Disk -IsOffline $False -verbose
### List
Get-IscsiTarget | FT
