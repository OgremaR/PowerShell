$Date = Get-Date -Format dd-MM-yyyy-HH-mm-ss
$computers = Get-Content -Path "\\pc-01\exchange\pc\pc.txt"
$computers = $computers.Trim()

foreach ($computer in $computers) {
    $temp = Invoke-Command -ComputerName $computer -ScriptBlock {get-childitem "hklm:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall" -name}
    if ($temp -like "*GFExperience*") {
        $computer >> \\pc-01\exchange\pc\\$env:computername-"("$Date")".md
        $temp >> \\pc-01\exchange\pc\\$env:computername-"("$Date")".md
        }
}