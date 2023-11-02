$file = Get-Content .\post2.txt
foreach ($user in $file) {
    Get-ADUser $user -Properties EmailAddress| select EmailAddress, DisplayName
}