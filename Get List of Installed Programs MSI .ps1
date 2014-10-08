Get-WmiObject -Class win32_product | Sort-Object IdentifyingNumber | FT Name, Version,IdentifyingNumber
