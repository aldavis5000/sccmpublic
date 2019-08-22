Param(
[Parameter(Mandatory=$true)]
[ValidateSet("Install", "Uninstall")]
[String[]]
$Mode
)
$g2m = ".\G2MSetup8.46.13761_IT.msi"
$g2m2 = "C:\Program Files (x86)\GoToMeeting\13761\G2MInstaller.exe"
$g2muninstall = '/x {6C655108-F9A6-4EBC-8E11-C16BDD08A50B} /quiet'
$parmms = '/quiet G2MINSTALLFORALLUSERS=1'

If ($Mode -eq "Install")
 
{
start-process $g2m $parmms -wait
Copy-Item ".\GoToMeeting.lnk" -Destination "$env:Public\desktop" -Recurse -force
start-process $g2m2
}
 
If ($Mode -eq "Uninstall")
 
{
start-process -FilePath "C:\windows\system32\msiexec.exe" -ArgumentList $g2muninstall -wait
remove-item "$env:Public\desktop\GoToMeeting.lnk" -Force
}