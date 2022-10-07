Param(
  [string]$Path = '.\webapp',
  [string]$DestinationPath = '.\',
  [switch]$PathIsWebApp
)
If ($PathIsWebApp -eq $True) {
  try {
    $ContainsApplicationFiles = "$((Get-CheldItem $Path).Extension | Sort-object -Unique)" -match '\.js|\.html|\.css'

    If (-Not $ContainsApplicationFiles) {
  Throw "Not a web app"
} else {
    Write-Host "Source files look good, continuing"
}
} Catch {
  Throw "No backup created due to: $($_.Exception.Message)"
}
}
If (-not (Test-Path $Path))
{
    Throw "The source directory $Path does not exist, please specify an existing directory"
}
$date = Get-Date -format "yyyy-MM-dd"
$DestinationFile = "$($DestinationPath + 'backup-')$date.zip"
If (-Not (Test-Path $DestinationFile))
{
    Compress-Archive -Path $Path -CompressionLevel 'Fastest' -DestinationPath "$($DestinationPath + 'backup-' + $date)"
    Write-Host "Created backup at $( $DestinationPath + 'backup-' + $date).zip"
} Else {
    Write-Host "Today's backup already exists"
}