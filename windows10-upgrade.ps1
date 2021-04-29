## remember to open a powershell console in logmein by typing powershell in before running the command below
$diskimage = Mount-DiskImage -ImagePath C:\temp\win10.iso
$imagelocation = Get-Volume -FileSystemLabel CPBA_X64FRE_EN-US_DV9
$imagelocation.DriveLetter
$path = ':\'
$exe = 'setup.exe'

$setup = $imagelocation.DriveLetter + $path + $exe
Suspend-BitLocker -MountPoint C:
Start-Process -filepath $setup -ArgumentList "/Auto upgrade /Bitlocker TryKeepActive"

#Run the following command after the upgrade is complete to resume bitlocker protection
#resume-bitlocker -mountpoint C:
