### Makes bulk changes to Active Directory AD properties based on user identity
### Create a .CSV with rows Identity, Title, Department

Import-module ActiveDirectory

$userList = Import-Csv 'C:\UserProperties.CSV'

foreach ($user in $userList){
   Set-ADUser -Identity $user.Identity -Title $user.Title -Department $user.Department
   ### Line below is for confirmation feedback, optional
   Get-ADUser -Identity $user.Identity -Properties Title,Department | ft Name,Title,Department
}
