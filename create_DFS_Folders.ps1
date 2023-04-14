$pathdfs = "\\rst.atlantis-pak.ru\DFS\Atlantis-Pak\Export Clients\"
$pathtarget = "\\rst-fsa\groups$\shares\Atlantis-Pak\Export Clients\"
$parts = Get-Content .\folders.txt
foreach ($part in $parts) {
    $pathd = $pathdfs+$part
    $patht = $pathtarget+$part
    New-DfsnFolder -Path $pathd -TargetPath $patht -EnableTargetFailback $false
}