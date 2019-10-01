import-module F:\sccm\AdminConsole\bin\ConfigurationManager.psd1
#Change the site Code
$SiteCode = "P01"
#provide the path list of packages to be Refreshed
$packages =GC "C:\scripts\pkglist.txt"
foreach ($package in $packages)
{
#Provide the DP server Name to be refreshed ON
$Server = "CM12DP01"  #host name is enough,no FQDN is required
$pkgs = Get-WmiObject -Namespace "root\SMS\Site_$($SiteCode)" -Query "Select * From SMS_DistributionPoint WHERE PackageID='$Package' and serverNALPath like '%$Server%'"
foreach ($pkg in $pkgs)
{
$pkg.RefreshNow = $true
$pkg.Put()
# "Pkg:" + $package + " "+ "Refreshed On" + " "+ "Server:" +$server | Out-File -FilePath C:\Scripts\server-refresh-results.txt -Append
}
}