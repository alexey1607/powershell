Disable-HPiLOCertificateAuthentication
Set-HPiLOSessionTimeOut -Confirm -Force -TimeOut 120


# DNSNAME,IP,MASK,GW
# server.example.com,10.10.10.10,255.255.255.0,10.10.10.20
$ilos = import-csv "C:\temp\newilo.csv"


$cred = Get-Credential -UserName Administrator -Message "Enter iLO password"


ForEach ($item in $ilos)
{

	$DNSNAME = $item.DNSNAME
	$IP = $item.IP
	$MASK = $item.MASK
	$GW = $item.GW
	Write-Host "Setting network on $DNSNAME"
   

	Set-HPiLONetworkSetting -Credential $cred -Server $DNSNAME -GatewayIP $GW -IPAddress $IP -SubnetMask $MASK -DisableCertificateAuthentication -Debug -Verbose
	

	Write-Host 'Pausing for 35 seconds for iLO reset with new IP'
	Reset-HPiLORIB -Credential $cred -Server $DNSNAME
	Start-Sleep -s 35


    if ((Test-NetConnection -Port 22 -ComputerName $IP -InformationLevel Quiet) -eq $true) 
        {
            write-host "server $IP online "
        }
            else 
        {
            write-host "!!!!!!!!!!!! SERVER $IP NOT ONLINE!!!!!!!!!!!!!!"
        }

}
