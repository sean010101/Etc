### Bandwidth, Measure time to download 10MB file
$a=Get-Date; Invoke-WebRequest 'http://client.akamai.com/install/test-objects/10MB.bin' | Out-Null; ((10 / ((NEW-TIMESPAN –Start $a –End (Get-Date)).totalseconds)) * 8)
