$user_name = "sidorov_in" 
# Read-Host -Prompt 'Write user name - '
$text = Get-ADPrincipalGroupMembership $user_name | select name
Write-Output $text > .\groups.txt
$groups = (Get-Content .\groups.txt).replace('  ' , '')
#Get-ADGroup -LDAPFilter “(name=*dfs*)” | Format-Table
foreach ($group in $groups) {
    $group = $group -replace ".{1}$"
    $data = Get-ADPrincipalGroupMembership $group | select name 2>$null
    Write-Output $data >> .\groups.txt
}