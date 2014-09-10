### PowerShell to set all disks online

get-disk | Set-Disk -IsOffline $False
