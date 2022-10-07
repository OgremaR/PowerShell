$data = Get-Date -UFormat "%d.%b.%Y"
$name = Read-Host -Prompt "Please enter your name"
Write-Output "Todays date is $data"
Write-Output "Today is the day $name began their PowerShell programming journey"