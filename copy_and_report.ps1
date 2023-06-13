$path_a = "C:\exchange\Directum\DirectumLauncher"
$path_b = "C:\exchange\Directum\DirectumLauncher2"
$start = Get-Date -Format dd-MM-yyyy-HH-mm-ss
$start | Out-File -Append .\"("copying_info_$start")".txt
Copy-Item -Path $path_a -Destination $path_b -Recurse
$end = Get-Date -Format dd-MM-yyyy-HH-mm-ss
$end | Out-File -Append .\"("copying_info_$start")".txt