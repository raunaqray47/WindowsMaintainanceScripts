$softwareList = Get-WmiObject -Class Win32_Product

foreach ($software in $softwareList) {
    $lastUsed = Get-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\$($software.IdentifyingNumber)" -Name "LastUsedTime" -ErrorAction SilentlyContinue
    
    if ($lastUsed -ne $null) {
        $lastUsedDate = [DateTime]::ParseExact($lastUsed.LastUsedTime, "yyyyMMdd", $null)
        $softwareName = $software.Name
        
        Write-Output "$softwareName - Last Used: $lastUsedDate"
    }
}