# Script for clearing Direction RX logs

$limit = (Get-Date).AddDays(-30)
$paths = "\\rst-dirx1\c$\inetpub\logs\DrxGenericService", "\\rst-dirx1\c$\inetpub\logs\DrxDelayedOperationsService", "\\rst-dirx1\c$\inetpub\logs\DrxLogService\remote", "\\rst-dirx1\c$\inetpub\logs\DrxWeb"

# Delete files older than the $limit.
foreach ($path in $paths) {
    Get-ChildItem -Path $path -Recurse -Force | Where-Object { !$_.PSIsContainer -and $_.LastWriteTime -lt $limit } | Remove-Item -Force
}

# Delete any empty directories left behind after deleting the old files.
#Get-ChildItem -Path $path -Recurse -Force | Where-Object { $_.PSIsContainer -and (Get-ChildItem -Path $_.FullName -Recurse -Force | Where-Object { !$_.PSIsContainer }) -eq $null } | Remove-Item -WhatIf -Force -Recurse