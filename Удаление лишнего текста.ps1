$users = Get-Content .\users.txt
foreach ($user in $users) {
    if ($user -like "rst"){
        $user = $user.Substring(4)
        $user
        }
}