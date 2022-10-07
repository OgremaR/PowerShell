netsh int ip reset

# Remove the static ip
Remove-NetIPAddress -InterfaceAlias Ethernet -Confirm:$false

# Remove the default gateway
Remove-NetRoute -InterfaceAlias Ethernet -Confirm:$false

# Add the new IP and gateway
New-NetIPAddress -InterfaceAlias Ethernet -AddressFamily IPv4 172.172.172.7 -PrefixLength 24 -Type Unicast -DefaultGateway 172.172.172.252 -Confirm:$false

Get-NetIPConfiguration -InterfaceAlias Ethernet