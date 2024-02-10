$DemoPort = 1194
$DemoFile = 'C:\Temp\demo.txt'
$DemoBanner = "Connection: OK"

$DemoEndpoint = New-Object System.Net.IPEndPoint([IPAddress]::Any, $DemoPort)
$DemoTCPPort = New-Object System.Net.Sockets.TcpListener $DemoEndpoint
$DemoTCPPort.Start()
Write-Output "The TCP Port $DemoPort is Open Now"
$AcceptIngTcp = $DemoTCPPort.AcceptTcpClient()
$Stream = $AcceptIngTcp.GetStream()
$DemoWriter = New-Object System.IO.StreamWriter($Stream)
$DemoBanner | % {
    $DemoWriter.WriteLine($_)
    $DemoWriter.Flush()
}

while ($true) {
    $DemoBuffer = New-Object System.IO.StreamReader $Stream
    $DEMOLINE = $DemoBuffer.ReadLine()
    if ($DEMOLINE -eq "exit") {
        break
    }
    else {
        $DEMOLINE
        $DEMOLINE |  Out-File $DemoFile -Append
    }
}
$DemoBuffer.Dispose()
$Stream.Dispose()
$AcceptIngTcp.Dispose()
$DemoTCPPort.Stop()
Write-Output "The TCP Port $DemoPort is Closed"