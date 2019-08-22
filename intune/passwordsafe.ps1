Param(
[Parameter(Mandatory=$true)]
[ValidateSet("Install", "Uninstall")]
[String[]]
$Mode
)
$app = ".\pwsafe64-3.49.1.msi"
$appuninstall = '/X {C2A02857-D138-446B-B181-442DEE20C8E6} /quiet'
$parmms = '/quiet /norestart'

If ($Mode -eq "Install")
 
{
start-process $app $parmms -wait
}
 
If ($Mode -eq "Uninstall")
 
{
start-process $appuninstall $parmms -wait
}