$PCs = Get-Content \\rst-fsa\otherdata$\storages\AdminScript\TrueConf\computers.txt
$date = Get-Date -Format dd-MM-yyyy-HH-mm-ss

foreach ($PC in $PCs) {
    if (Test-Connection $PC 2>$null){
    Copy-Item -Path \\rst-fsa\otherdata$\storages\AdminScript\TrueConf\Runer_TrueConf.bat -Destination \\$PC\c$\TrueConf\ -Recurse
	Copy-Item -Path \\rst-fsa\otherdata$\storages\AdminScript\TrueConf\trueconf_client_x64.exe -Destination \\$PC\c$\TrueConf\ -Recurse
    Invoke-Command -ComputerName $PC -ScriptBlock {
    & "C:\TrueConf\Runer_TrueConf.bat"
    Remove-Item -Recurse C:\TrueConf\
    }}
    else {"$PC is not available!!! _______" |  Out-File -Append \\rst-fsa\otherdata$\storages\AdminScript\TrueConf\$date.txt}
    "$PC" |  Out-File -Append \\rst-fsa\otherdata$\storages\AdminScript\TrueConf\$date.txt
}