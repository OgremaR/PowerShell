$name = "uzb"
$group_name = "dfs_ap_ec_" + "$name" + "_write" # Read-Host -Prompt 'Write user name - '
$groups = Get-ADGroupMember $group_name | select name
Write-Output $groups >> .\$group_name.txt
foreach ($group in $groups) {
    $group = $group -replace '@{name=', ''
    $group = $group -replace '}', ''
    $data = Get-ADGroupMember "$group" | select name
    Write-Output $group >> .\$group_name.txt
    Write-Output $data >> .\$group_name.txt
}