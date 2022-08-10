hostname

wmic qfe list | find "4474419" >> "\\hfvmfs01\P&I\Patches\Cybereason\%computername%.txt"

wmic qfe list | find "3033929" >> "\\hfvmfs01\P&I\Patches\Cybereason\%computername%.txt"

dir "C:\Program Files (x86)\Symantec\Symantec Endpoint Protection\"  >> "\\hfvmfs01\P&I\Patches\Cybereason\%computername%.txt"

::echo %date:~10,4%%date:~4,2%%date:~7,2% %time% >> "\\hfvmfs01\P&I\Patches\Cybereason\%computername%.txt"

::powershell.exe -Command "(Get-WmiObject -Class Win32_Product -Filter {Name='Symantec Endpoint Protection'} -ComputerName . ).Uninstall()" >> "\\hfvmfs01\P&I\Patches\Cybereason\%computername%.txt"

::timeout /t 20

::dir "C:\Program Files (x86)\Symantec\Symantec Endpoint Protection\"  >> "\\hfvmfs01\P&I\Patches\Cybereason\%computername%.txt"