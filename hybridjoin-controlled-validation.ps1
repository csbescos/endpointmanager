#Add tenant ID and Tenantname to variables and then deploy to the computers that you would like to manually hybrid join.
$tenantid = ""
$tenantname = "divergeit.onmicrosoft.com"
new-item -path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CDJ\AAD"
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CDJ\AAD" -Name TenantId -PropertyType string -Value $tenantid
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CDJ\AAD" -Name TenantName -PropertyType string -Value $tenantname
