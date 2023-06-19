$path1 = '\\any\directory\'
$Date = Get-Date -Format dd-MM-yyyy-HH-mm-ss
$counter = 0
$path1_2 = '\UserData\TS\$RECYCLE.BIN\', '\Загрузки\$RECYCLE.BIN\', '\Мои документы\$RECYCLE.BIN\', '\Мои документы\Моя музыка\$RECYCLE.BIN\', '\Мои документы\Мои рисунки\$RECYCLE.BIN\', '\Мои документы\Мои видеозаписи\$RECYCLE.BIN\'
$users_1 = Get-ChildItem -Name '\\any\directory\'
foreach ($user in $users_1) {
    foreach ($path in $path1_2) {
    $full_path = $path1 + $user + $path
    $counter += ((gci –force $full_path –Recurse -ErrorAction SilentlyContinue| measure Length -s).sum / 1Mb)
    $full_path, $counter | Out-File -Append .\home_$Date.txt
    }
}
$Gb = $counter / 1024
"As a result Gb = $Gb" | Out-File -Append .\home_$Date.txt