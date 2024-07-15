$path = C:\Schneider\ScriptingPath\Powershell\BrowserUpgrade\Firefox\FirefoxUpdate.ps1
$serverList=Get-Content -path "C:\Schneider\ScriptingPath\Powershell\ExecuteScriptonRR\ServerList.txt"
foreach($server in $serverList)
{
    $s = New-PSSession -ComputerName $server
    Invoke-Command -Session $s -Command { $path }
}