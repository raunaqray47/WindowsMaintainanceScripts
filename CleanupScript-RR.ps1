write-Host "Removing Temp Files Start"
try 
{
    #write-Host "Emptying C:\Users\*\Appdata\Local\Temp\..."
    Set-Location "C:\Users"
    Remove-Item ".\*\Appdata\Local\Temp\*"ù -Recurse -Force -ErrorAction SilentlyContinue
    write-Host "Removed C:\Users\*\Appdata\Local\Temp\"
}
catch { "Failed to delete C:\Users\*\Appdata\Local\Temp\" }
write-Host "Removing Package Files Start"
try 
{
    #write-Host "Emptying C:\Users\*\Appdata\Local\Packages\..."
    Set-Location "C:\Users"
    Remove-Item ".\*\Appdata\Local\Packages\*"ù -Recurse -Force -ErrorAction SilentlyContinue
    write-Host "Removed C:\Users\*\Appdata\Local\Temp\"
}
catch { "Failed to delete C:\Users\*\Appdata\Local\Temp\" }
try 
{
    #write-Host "Emptying C:\Windows\Temp..."
    Set-Location "C:\Windows\Temp"
    Remove-Item * -Recurse -Force -ErrorAction SilentlyContinue
    write-Host "Removed C:\Windows\Temp"
}
catch { "Failed to delete C:\Windows\Temp" }
try 
{
    #write-Host "Emptying C:\Windows\Prefetch..."
    Set-Location "C:\Windows\Prefetch"
    Remove-Item * -Recurse -Force -ErrorAction SilentlyContinue
    write-Host "Removed C:\Windows\Prefetch"
}
catch { "Failed to delete C:\Windows\Prefetch" }
write-Host "Clearing Recycle Bin Start"
try 
{
    Start-Sleep 2
    Clear-RecycleBin -Force
    Start-Sleep 2
}
catch { "Failed to clean Recycle Bin" }
write-Host "Clearing Temp Files and Recycle Bin Complete!"