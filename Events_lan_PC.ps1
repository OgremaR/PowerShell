Get-EventLog -ComputerName PC-DC4 System #| Select-Object -Property EventID, TimeGenerated, @{e={$_.ReplacementStrings[0]}} | 
    Out-File -FilePath C:\Users\_sidorov\Desktop\EventLogAD.txt