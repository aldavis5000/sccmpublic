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

#Try the Install and return results
Try {
    Start-Process -FilePath $applicationuninstall -ArgumentList $parms -Wait
    start-process -FilePath $application -ArgumentList $parms -wait
    }
Catch {
    Write-Error -Message $_
    Exit 1
    }
}
 
If ($Mode -eq "Uninstall")
 
{
start-process $citrixuninstall $parms
}