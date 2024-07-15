write-Host "Starting Disk Cleanup"
Start-Sleep 1
write-Host "Running the Windows Disk Clean up Tool..." 
cleanmgr /sagerun:1 | out-Null
Start-Sleep 1
write-Host "Disk Cleanup Complete"