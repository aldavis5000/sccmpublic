Param(
[Parameter(Mandatory=$true)]
[ValidateSet("Install", "Uninstall")]
[String[]]
$Mode
)
$application = ".\CitrixWorkspaceApp.exe"
$applicationuninstall = ".\ReceiverCleanupUtility.exe"
$parms = '/silent'

If ($Mode -eq "Install")
 
{

Start-Process -FilePath $applicationuninstall -ArgumentList $parms -Wait
& $application $parms
sleep -Seconds 180
 
}

 
If ($Mode -eq "Uninstall")
 
{
start-process $citrixuninstall $parms
}