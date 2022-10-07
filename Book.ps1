function Get-Printer (172.172.172.16, 172.172.172.213, $full) {
    $internal = gwmi Win32_Printer -ComputerName $computer -Filter "name='$name'"
    # здесь я предлагаю получить как полный набор свойств, так и упрощённый вывод сведений.
    if ($full) {$internal | select *} else {Write-Host $internal}
}