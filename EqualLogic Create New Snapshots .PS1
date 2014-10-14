### EqualLogic Powershell - Set existing snapshots offline for all volumes, create new read-only snapshots on all volumes

### Disconnect all ISCSI connections
Get-IscsiTarget | Disconnect-IscsiTarget -Confirm:$false
### Connect to EqualLogic
Connect-EqlGroup -GroupAddress 0.0.0.0 -Credential (Get-Credential -Credential USERNAME)
### Set all EqualLogic Snapshots Offline
Get-EqlVolume | Get-EqlSnapshot | Set-EqlSnapshot -OnlineStatus offline
### Create new Snapshots
Get-EqlVolume | New-EqlSnapshot -OnlineStatus online -AccessType read_only
Disconnect-EqlGroup
### Enumerate the new Snapshots
Update-IscsiTarget
### Connect to new Snapshots
Get-IscsiTarget | connect-IscsiTarget
### Rescan disks
Update-HostStorageCache
### Set all disks to online
get-disk | Set-Disk -IsOffline $False