$parts = Get-Content .\folders.txt
$gp = "dfs_ap_ec_"
$OU = "OU=Export Clients,OU=xxx-Pak,OU=DFS,OU=xxxxxxx,DC=XXXXdomen,DC=xxxxx-pak,DC=ru"
foreach ($part in $parts) {
    $gpRead = $gp+$part+"_read"
    $gpWrite = $gp+$part+"_write"
    New-ADGroup -Name $gpRead -SamAccountName $gpRead -GroupCategory Security -GroupScope DomainLocal -DisplayName $gpRead -Path $OU -Description ""
    New-ADGroup -Name $gpWrite -SamAccountName $gpWrite -GroupCategory Security -GroupScope DomainLocal -DisplayName $gpWrite -Path $OU -Description ""
}