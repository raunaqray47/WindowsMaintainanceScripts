#Uninstall current Chrome version
#Variables
$SEARCH = 'chrome$'
#Fetch all installed applications
$INSTALLED = Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* |  Select-Object DisplayName, UninstallString
$INSTALLED += Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* | Select-Object DisplayName, UninstallString
#Search for chrome
$RESULT = $INSTALLED | ?{ $_.DisplayName -ne $null } | Where-Object {$_.DisplayName -match $SEARCH } 
#Uninstall Chrome
if ($RESULT.uninstallstring -like "msiexec*") 
{
    $ARGS=(($RESULT.UninstallString -split ' ')[1] -replace '/I','/X ') + ' /q'
    Start-Process msiexec.exe -ArgumentList $ARGS -Wait
} 
else 
{
    $UNINSTALL_COMMAND=(($RESULT.UninstallString -split '\"')[1])
    $UNINSTALL_ARGS=(($RESULT.UninstallString -split '\"')[2]) + ' --force-uninstall'
    Start-Process $UNINSTALL_COMMAND -ArgumentList $UNINSTALL_ARGS -Wait
}