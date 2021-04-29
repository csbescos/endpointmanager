$class = cimclass MSFT_TaskEventTrigger root/Microsoft/Windows/TaskScheduler

$A = New-ScheduledTaskAction -Execute "c:\windows\system32\deviceenroller.exe /c /AutoEnrollMDM"
$T1 = New-ScheduledTaskTrigger -AtLogon

$T2 = $class | New-CimInstance -ClientOnly
$T2.Enabled = $True
$T2.Subscription = '<QueryList><Query Id="0" Path="Microsoft-Windows-NetworkProfile/Operational"><Select Path="Microsoft-Windows-NetworkProfile/Operational">*[System[Provider[@Name=''Microsoft-Windows-NetworkProfile''] and EventID=10002]]</Select></Query></QueryList>'

$T3 = $class | New-CimInstance -ClientOnly
$T3.Enabled = $True
$T3.Subscription = '<QueryList><Query Id="0" Path="Microsoft-Windows-NetworkProfile/Operational"><Select Path="Microsoft-Windows-NetworkProfile/Operational">*[System[Provider[@Name=''Microsoft-Windows-NetworkProfile''] and EventID=4004]]</Select></Query></QueryList>'

$P = New-ScheduledTaskPrincipal "NT AUTHORITY\SYSTEM"
$S = New-ScheduledTaskSettingsSet
$D = New-ScheduledTask -Action $A -Principal $P -Trigger $T1,$T2,$T3 -Settings $S
Register-ScheduledTask MDM_Enrollment -InputObject $D
