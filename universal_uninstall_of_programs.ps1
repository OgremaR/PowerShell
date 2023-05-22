$date = Get-Date -Format dd-MM-yyyy-HH-mm-ss
$regNames = Get-ChildItem 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\' -Include "*{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8}_*" -name
$regPath = "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\"

Get-Service -DisplayName "NVIDIA*"  | Stop-Service
Get-Process "NVIDIA Web Helper" | Stop-Process -Force

#Remove-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*}_NV*"

foreach ($name in $regNames) {
    $regPath = "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\" + $name
    if (reg query "$regPath" /reg:64) {
    reg delete "$regPath" /f /reg:64
    }
    else {
    reg delete "$regPath" /f /reg:32 2>&1|
    Out-File -Append \\XXX\Uninstall_GeForceExperience_Log\$env:computername-"("$Date")".txt
    }
}
reg delete "HKLM\SOFTWARE\NVIDIA Corporation\Global\GFExperience" /f /reg:64 2>&1|
Out-File -Append \\XXX\Uninstall_GeForceExperience_Log\$env:computername-"("$Date")".txt
reg delete "HKLM\SOFTWARE\WOW6432Node\NVIDIA Corporation\Global\GFExperience" /f /reg:64 2>&1|
Out-File -Append \\XXX\Uninstall_GeForceExperience_Log\$env:computername-"("$Date")".txt

reg delete "HKLM\SOFTWARE\NVIDIA Corporation\Global\GFExperience" /f /reg:32 2>&1|
Out-File -Append \\XXX\Uninstall_GeForceExperience_Log\$env:computername-"("$Date")".txt
reg delete "HKLM\SOFTWARE\WOW6432Node\NVIDIA Corporation\Global\GFExperience" /f /reg:32 2>&1|
Out-File -Append \\XXX\Uninstall_GeForceExperience_Log\$env:computername-"("$Date")".txt

if ((Test-Path -Path "C:\Program Files\NVIDIA Corporation\") -eq $True){
    Remove-Item -LiteralPath "C:\Program Files\NVIDIA Corporation\" -Force -Recurse 2>&1|
    Out-File -Append \\XXX\Uninstall_GeForceExperience_Log\$env:computername-"("$Date")".txt
}
if ((Test-Path -Path "C:\Program Files (x86)\NVIDIA Corporation\") -eq $True){
    Remove-Item -LiteralPath "C:\Program Files (x86)\NVIDIA Corporation\" -Force -Recurse 2>&1|
    Out-File -Append \\XXX\Uninstall_GeForceExperience_Log\$env:computername-"("$Date")".txt
}