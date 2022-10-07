#############################################################
# Имя: PSInfo.ps1
# Автор: Сидоров Игорь Николаевич
# Язык: PoSH 5.1
# Описание: Сбор основных данных о комьютере по сети.
#############################################################
$Flag = ''
while ($Flag -ne 'Y') {
$Comp = Read-Host -Prompt 'Write computer name or ip'
Get-WmiObject -Class Win32_ComputerSystem -ComputerName $Comp | Select-Object UserName, PSComputerName | Format-list
Get-WmiObject Win32_NetworkAdapterConfiguration -ComputerName $Comp | Where-Object {$_.IPEnabled} | 
Select-Object Index, Description, DHCPEnabled, IPAddress, IPSubnet, DefaultIPGateway, MACAddress, GatewayCostMetric, IPConnectionMetric
Get-WmiObject win32_processor -ComputerName $Comp | Select-Object DeviceID, Name, Description, MaxClockSpeed, L2CacheSize, SocketDesignation
Get-WmiObject Win32_PhysicalMemory -ComputerName $Comp |
Select-Object Description, BankLabel,@{Name="Capacity, Mb"; Expression={$_.Capacity/1Mb}} | Format-Table
Get-WmiObject -Class Win32_logicaldisk -ComputerName $Comp |
Select-Object DeviceID, @{Name="FreeSpace, Gb"; Expression={$_.FreeSpace/1Gb}}, DriveType, @{Name="Size, Gb"; Expression={$_.Size/1Gb}} | Format-Table
Get-WmiObject -Class Win32_VideoController -ComputerName $Comp|
Format-List Name, AdapterDACType, Stasus, AdapterRAM, VideoModeDescription, MaxRefreshRate, MinRefreshRate, DriverVersion, InstalledDisplayDrivers
$Flag = Read-Host -Prompt 'For stop the program press - Y'
}