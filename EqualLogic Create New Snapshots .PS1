### THIS DOESN'T WORK

### EqualLogic Powershell - Set existing snapshots offline for all volumes, create new snapshots on all volumes

### Connect to EqualLogic
Connect-EqlGroup -GroupAddress 0.0.0.0 -Credential (Get-Credential -Credential USERNAME)
### Set all EqualLogic Snapshots Offline
Get-EqlVolume | Get-EqlSnapshot | Set-EqlSnapshot -OnlineStatus offline
### Create new Snapshots
Get-EqlVolume | New-EqlSnapshot -OnlineStatus online -AccessType read_only
Disconnect-EqlGroup
get-IscsiTarget |FT isconnected,nodeaddress -AutoSize
### Enumerate the new Snapshots
start-sleep -s 10
Update-IscsiTarget
### Connect to new Snapshots
Get-IscsiTarget | Connect-IscsiTarget -IsMultipathEnabled:$true
get-IscsiTarget |FT isconnected,nodeaddress -AutoSize
### Rescan disks
start-sleep -s 10
Update-HostStorageCache
### Set all disks to online
get-disk | Set-Disk -IsOffline $False
