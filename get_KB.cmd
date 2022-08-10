@ECHO OFF

:: This CMD script provides OS Name, OS Version and Windows Latest Updates

ECHO Listing Windows Updates

ECHO ===========================================

hostname

powershell Get-HotFix | where {$_.InstalledOn -gt (get-date).AddDays(-30)} > \\hfvmfs01\Patches\EMA133\%computername%_2022_02.txt
