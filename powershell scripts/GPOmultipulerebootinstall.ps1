$company = test-path c:\company
if ($company -eq $false)
{new-item -ItemType directory c:\company}
copy-item -path .\company_-_Workstations_FireAMPSetup.exe  -Destination c:\company
copy-item -path .\company.bat -Destination c:\company
c:\company\company_-_Workstations_FireAMPSetup.exe /R /S /remove 0 /uninstallpassword P@ssw0rd
C:\windows\system32\schtasks.exe /ru "SYSTEM" /Create /SC ONLOGON /TN "Ampinstall" /TR "c:\company\company.bat"
#new-itemproperty -path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce -name "myInstall" -value '"c:\company.bat"'
New-Item -ItemType File c:\company\reboot.txt
New-Item -ItemType File c:\company\ampinstalled.txt