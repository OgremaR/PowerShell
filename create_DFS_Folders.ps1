$pathdfs = "\\xxx.ru\DFS\xxx\"
$pathtarget = "\\xxx\groups$\shares\xxx"
$parts = Get-Content .\folders.txt
foreach ($part in $parts) {
    $pathd = $pathdfs+$part
    $patht = $pathtarget+$part
    New-DfsnFolder -Path $pathd -TargetPath $patht -EnableTargetFailback $false
}
