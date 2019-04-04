$Computername = Get-Content C:\myscripts\computers.txt
foreach ($Computer in $ComputerName) {
        
        New-Object psobject -Property @{
            ComputerName = $Computer
            LastBootUpTime = [Management.ManagementDateTimeConverter]::ToDateTime( (Get-WmiObject -Class Win32_OperatingSystem -Computer $Computer | Select -Exp LastBootUpTime) )
        }
    
    }