$path_a = "\\any\directory\DirectumLauncher"
$path_b = "\\anyPC\directory\"
$start = Get-Date -Format dd-MM-yyyy-HH-mm-ss
$start | Out-File -Append "\\anyPC\directory\(start_copying_DirectumLauncher_$start).txt"
Copy-Item -Path $path_a -Destination $path_b -Recurse
$end = Get-Date -Format dd-MM-yyyy-HH-mm-ss
$end | Out-File -Append "\\anyPC\directory\(end_copying_DirectumLauncher_$end).txt"