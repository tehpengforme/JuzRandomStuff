const HKEY_LOCAL_MACHINE = &H80000002
Const ForReading = 1, ForWriting = 2, ForAppending = 8
strComputer = "."
Set oReg=GetObject("winmgmts:{impersonationLevel=impersonate}!\\" & strComputer & "\root\default:StdRegProv")
strOutputKey = "SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" 'Hostname related key
strKeyPath = "SOFTWARE\Microsoft\HTMLHelp"
strDataKeyPath = "SOFTWARE\Microsoft\HTMLHelp\data" 'Compromised registry key

strDate = Day(Now()) & "/" & Month(Now()) & "/" & Year(Now()) & " " & Time() 'Proper time format

oReg.GetStringValue HKEY_LOCAL_MACHINE, strOutputKey, "Hostname", strHostname
strOutput = strDate & "," & strHostname & ","

oReg.EnumKey HKEY_LOCAL_MACHINE, strKeyPath, arrSubKeys

If oReg.EnumKey(HKEY_LOCAL_MACHINE, strDataKeyPath, arrDataSubKeys) = 0 Then
	strOutput = strOutput & "Compromised!"
Else
	strOutput = strOutput & "Not Compromised"
End If

For Each subkey In arrSubKeys
	strOutput = strOutput & "," & subkey 
Next

Set f = CreateObject("Scripting.FileSystemObject")
currentPath = f.GetAbsolutePathName(".")

if Right(currentPath, 1) = "\" Then
	filePath = currentPath & "ema30g_standalone.csv"
Else
	filePath = currentPath & "\ema30g_standalone.csv"
End If

set outFile = f.CreateTextFile(filePath, True)
outFile.WriteLine(strOutput)
outFile.Close
Wscript.Echo "Check Done"
Wscript.Echo strOutput