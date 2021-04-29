mkdir C:\Temp 
New-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\OOBE -Name DisablePrivacyExperience -value 1 -PropertyType DWORD -Force
## remember to open a powershell console in logmein by typing powershell in before running the command below
$A = New-ScheduledTaskAction -Execute "Powershell.exe" -Argument "Start-BitsTransfer -Source https://google.com/win10.iso -Destination C:\Temp\win10.iso"
$T = New-ScheduledTaskTrigger -AtLogon
$P = New-ScheduledTaskPrincipal "NT AUTHORITY\SYSTEM"
$S = New-ScheduledTaskSettingsSet
$D = New-ScheduledTask -Action $A -Principal $P -Trigger $T -Settings $S
Register-ScheduledTask W10 -InputObject $D
Start-ScheduledTask W10

