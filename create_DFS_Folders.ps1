$pathdfs = "\\xxxxx-pak.ru\DFS\xxxxx"
$pathtarget = "\\xxxx\groups$\shares\xxxxx\"
$parts = Get-Content .\folders.txt
foreach ($part in $parts) {
    $pathd = $pathdfs+$part
    $patht = $pathtarget+$part
    New-DfsnFolder -Path $pathd -TargetPath $patht -EnableTargetFailback $false
}