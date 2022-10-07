$Printer= Read-Host -Prompt 'Write IP printer'
Invoke-SnmpWalk $Printer -OID 1.3.6.1.2.1.3.1 | Format-Table data
PAUSE