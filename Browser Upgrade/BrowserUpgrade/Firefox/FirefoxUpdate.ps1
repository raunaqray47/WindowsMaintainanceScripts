#Uninstall current Firefox version
#Variables
$SEARCH = 'firefox'
#Fetch all installed applications
$INSTALLED = Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* |  Select-Object DisplayName, UninstallString
$INSTALLED += Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* | Select-Object DisplayName, UninstallString
#Search for chrome
$RESULT = $INSTALLED | ?{ $_.DisplayName -ne $null } | Where-Object {$_.DisplayName -match $SEARCH }
#Uninstall Firefox
if ($RESULT.uninstallstring -like "msiexec*") 
{
    $ARGS=(($RESULT.UninstallString -split ' ')[1] -replace '/I','/X ') + ' /q'
    Start-Process msiexec.exe -ArgumentList $ARGS -Wait
} 
else 
{
    $UNINSTALL_COMMAND=(($RESULT.UninstallString -split '\"')[1])
    $UNINSTALL_ARGS=(($RESULT.UninstallString -split '\"')[2]) + ' /S'
    Start-Process $UNINSTALL_COMMAND -ArgumentList $UNINSTALL_ARGS -Wait
}
Start-Sleep -Seconds 5

#Install the Latest Version
#Create temp path 
mkdir -Path $env:temp\firefoxinstall -erroraction SilentlyContinue | Out-Null
$Download = join-path $env:temp\firefoxinstall firefox_installer.exe
#Download installer and store in temp path
Invoke-WebRequest 'https://download.mozilla.org/?product=firefox-latest&os=win64&lang=en-US' -OutFile $Download
#Silent install Firefox
Invoke-Expression "$Download /S"
<#Verify Installation
Start-Sleep -Seconds 60
$INSTALLED = Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* |  Select-Object DisplayName, DisplayVersion, Publisher, InstallDate
$INSTALLED += Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* | Select-Object DisplayName, DisplayVersion, Publisher, InstallDate
$INSTALLED | ?{ $_.DisplayName -match 'firefox' } | sort-object -Property DisplayName -Unique | Format-Table -AutoSize#>