$parts = Get-Content .\folders.txt
$gp = "dfs_xx_xx_"
foreach ($part in $parts) {
    $pathdfs = "\\xxxx.ru\DFS\xxxx-Pak\xxxxx\"+$part
    $gpRead = $gp+$part+"_read"+":RX"
    $gpWrite = $gp+$part+"_write"+":RX"
    dfsutil property sd grant $pathdfs "$gpRead" Protect Replace
    dfsutil property sd grant $pathdfs "$gpWrite" Protect Replace
}