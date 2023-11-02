$PCs = Get-Content \\xxxxxx\TrueConf\computers.txt
$date = Get-Date -Format dd-MM-yyyy-HH-mm-ss

foreach ($PC in $PCs) {
    if (Test-Connection $PC 2>$null){
    Copy-Item -Path \\xxxxxx\TrueConf\Runer_TrueConf.bat -Destination \\$PC\c$\TrueConf\ -Recurse
	Copy-Item -Path \\xxxxxx\TrueConf\trueconf_client_x64.exe -Destination \\$PC\c$\TrueConf\ -Recurse
    Invoke-Command -ComputerName $PC -ScriptBlock {
    & "C:\TrueConf\Runer_TrueConf.bat"
    Remove-Item -Recurse C:\TrueConf\
    }}
    else {"$PC is not available!!! _______" |  Out-File -Append \\xxxxxx\TrueConf\$date.txt}
    "$PC" |  Out-File -Append \\xxxxxx\TrueConf\$date.txt
}