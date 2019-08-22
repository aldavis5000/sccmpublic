Param(
[Parameter(Mandatory=$true)]
[ValidateSet("Install", "Uninstall")]
[String[]]
$Mode
)
$fire = ".\Firefox Setup 68.0.1.exe"
$fireuninstall = "$env:ProgramFiles\Mozilla Firefox\uninstall\helper.exe"
$parmms = "-ms"
If ($Mode -eq "Install")
{
& $fire $parmms
Copy-Item ".\override.ini" -Destination "$env:ProgramFiles\Mozilla Firefox\browser" -Recurse -force
Copy-Item ".\mozilla.cfg" -Destination "$env:ProgramFiles\Mozilla Firefox" -Recurse -force
Copy-Item ".\local-settings.js" -Destination "$env:ProgramFiles\Mozilla Firefox\defaults\pref" -Recurse -force
}
If ($Mode -eq "Uninstall")
{
& $fireuninstall $parmms
}
