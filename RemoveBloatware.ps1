# List of app package names to remove
$appPackagesToRemove = @(
    "Microsoft.549981C3F5F10",
    "Microsoft.MicrosoftOfficeHub",
    "Microsoft.MicrosoftStickyNotes",
    "Microsoft.WindowsAlarms",
    "Microsoft.WindowsFeedbackHub",
    "Microsoft.GetHelp",
    "Microsoft.3DBuilder",
    "Microsoft.Getstarted",
    "Microsoft.Messaging",
    "Microsoft.Microsoft3DViewer",
    "Microsoft.MicrosoftSolitaireCollection",
    "Microsoft.MicrosoftOfficeHub",
    "Microsoft.MicrosoftStickyNotes",
    "Microsoft.MixedReality.Portal",
    "Microsoft.OneConnect",
    "Microsoft.People",
    "Microsoft.Print3D",
    "Microsoft.SkypeApp",
    "Microsoft.Wallet",
    "Microsoft.WindowsAlarms",
    "microsoft.windowscommunicationsapps",
    "Microsoft.WindowsFeedbackHub",
    "Microsoft.WindowsMaps",
    "Microsoft.YourPhone",
    "Microsoft.ZuneMusic",
    "Microsoft.ZuneVideo",
    "Microsoft.BingNews"
)

# Loop through each app package name and remove the app
foreach ($appPackage in $appPackagesToRemove) {
    $packageFullName = (Get-AppxPackage | Where-Object { $_.PackageFamilyName -like "*$appPackage*" }).PackageFullName
    
    if ($packageFullName) {
        Write-Output "Removing $packageFullName..."
        Remove-AppxPackage -Package $packageFullName -ErrorAction SilentlyContinue
        Write-Output "Removed $packageFullName."
    }
    else {
        Write-Output "App package $appPackage is not installed or could not be found."
    }
}