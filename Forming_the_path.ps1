# Forming the path to the file
[string]$Path1 = 'C:\Users'
[string]$Path2 = '\AppData\Roaming\Yandex\YandexBrowser\User Data\Default\Bookmarks'
$user = whoami
$user = $user.Substring(3)
$DestinationFile = "$($Path1 + $user + $Path2)"

# If there is a file, then ...
If ((Test-Path $DestinationFile) -eq $True) {

$DestinationFile #outputs the path itself
}