### AD Group Membership Recursive, output names email addresses

Get-ADGroupMember administrators -Recursive | Get-ADUser | Select Name,UserPrincipalName | Sort-Object Name | Out-GridView
