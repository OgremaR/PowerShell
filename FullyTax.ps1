$Status = 'Adu'
If ($Status -eq 'Minor')
{
    Write-Host $false
} ElseIf ($Status -eq 'Adult') {
Write-Host $true
} Else {
Write-Host $false
}