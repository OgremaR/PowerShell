$path1 = '\\any\directory\'
$Date = Get-Date -Format dd-MM-yyyy-HH-mm-ss
$counter = 0
$path2 = '\UserData\TS\$RECYCLE.BIN\', '\Загрузки\$RECYCLE.BIN\', '\Мои документы\$RECYCLE.BIN\', '\Мои документы\Моя музыка\$RECYCLE.BIN\', '\Мои документы\Мои рисунки\$RECYCLE.BIN\', '\Мои документы\Мои видеозаписи\$RECYCLE.BIN\'
$users = Get-ChildItem -Name '\\rst-fsa\homes$\RST\'
foreach ($user in $users) {
    foreach ($path in $path2) {
    $full_path = $path1 + $user + $path
    $full_path | Out-File -Append .\home_$Date.txt
    Test-Path $full_path 2>&1 | Out-File -Append .\home_$Date.txt
    $testpath = Test-Path $full_path
    if ($testpath -eq 'True') {
        $counter += ((gci –force $full_path –Recurse -ErrorAction SilentlyContinue| measure Length -s).sum / 1Mb)
        $counter | Out-File -Append .\home_$Date.txt
        }
    }
}
$Gb = $counter / 1024
"As a result Gb = $Gb" | Out-File -Append .\home_$Date.txt
$wshell = New-Object -ComObject Wscript.shell
$Output = $wshell.Popup("В результате - $Gb Гб.",0,"Файл создан home_$Date.txt",64)