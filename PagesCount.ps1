$OIDTotalPages = ".1.3.6.1.2.1.43.10.2.1.4.1"
$OIDPrinterName = ".1.3.6.1.2.1.25.3.2.1.3"
$Date = Get-Date -Format 'yyyy-MM-dd-hh-mm-ss' -OutVariable date
$Printers = Get-Content .\Printers.txt

foreach ($Printer in $Printers) {
    $Split =  $Printer -split " "
    $PrinterIP =$Split[1]
    $Cabinet = $Split[0]
    $PageCount= (Invoke-SnmpWalk -IP $PrinterIP -OID $OIDTotalPages).data
    $Names = (Invoke-SnmpWalk -IP $PrinterIP -OID $OIDPrinterName).data
    $PrinterName= $Names | select -First 1
    Write-Output "`n" "`n" "Кабинет №:$Cabinet" "IP устройства:$PrinterIP" "Устройство:$PrinterName" "Страниц:$PageCount" >> .\PrintData$Date.txt
}

$wshell = New-Object -ComObject Wscript.shell
$Output = $wshell.Popup("Файл создан PrintData$Date.txt",0,"Просмотр статистики ",64)