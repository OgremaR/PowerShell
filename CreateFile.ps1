# CreateFile.ps1
Param (
    [Parameter(Mandatory, HelpMessage = "Please provide a valid path")]
    $Path
)
New-Item $Path # Creates a new file at $Path.
Write-Host "File $Path was created"