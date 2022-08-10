@ECHO OFF

:: This CMD script provides OS Name, OS Version and Windows Latest Updates

ECHO Listing Windows Updates

ECHO ===========================================


wmic qfe list | find "5009543" > \\hfvmfs01\Patches\EMA133\%computername%_2022_02.txt