#Kill OneDrive
taskkill /f /im OneDrive.exe

#Kill MSI After Burner
taskkill /f /im MSIAfterburner.exe

#Kill RivaTuner
taskkill /f /im RTSS.exe
taskkill /f /im EncoderServer.exe
taskkill /f /im RTSSHooksLoader64.exe

#Kill IDM
taskkill /f /im IDMan.exe

#Kill EA Background Service
taskkill /f /im EABackgroundService.exe
exit

read-host "Press Enter to proceed"