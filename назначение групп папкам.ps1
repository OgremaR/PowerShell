$pathdfs = "\\xxxxx-pak.ru\DFS\xxxxxx-Pak\xxxxx\"
$pathtarget = "\\xxxxxx\groups$\shares\xxxxxx-Pak\xxxxx\"
$parts = Get-Content .\folders.txt
foreach ($part in $parts) {
    #$pathd = $pathdfs+$part
    $patht = $pathtarget+$part
    $gpread = "dfs_xx_xx_"+$part+"_read"
    $gpwrite = "dfs_xx_xx_"+$part+"_write"
    $Acl = Get-Acl $patht
    $Ar = New-Object System.Security.AccessControl.FileSystemAccessRule($gpread, "ReadAndExecute", "ContainerInherit,ObjectInherit", "None", "Allow")
    $Acl.SetAccessRule($Ar)
    Set-Acl $patht $Acl
    $Acl = Get-Acl $patht
    $Ar = New-Object System.Security.AccessControl.FileSystemAccessRule($gpwrite, "Modify", "ContainerInherit,ObjectInherit", "None", "Allow")
    $Acl.SetAccessRule($Ar)
    Set-Acl $patht $Acl
}