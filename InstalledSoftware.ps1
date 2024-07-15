$computername = $env:COMPUTERNAME
$filepath = "D:\InstalledSoftwares_$computername.csv"
#$filepath = "\\amznfsxtqplhzth.gad.schneider-electric.com\share\EIA-RPA\BPTest\RPA Data\System\InstalledSoftwares.txt"
$INSTALLED = Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* |  Select-Object DisplayName
$INSTALLED += Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* | Select-Object DisplayName
$INSTALLED | ForEach-Object { Add-Content -Path  $filepath -Value $_ }
Start-Sleep -Seconds 2