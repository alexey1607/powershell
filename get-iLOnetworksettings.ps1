Disable-HPiLOCertificateAuthentication
Set-HPiLOSessionTimeOut -Confirm -Force -TimeOut 120
$ilos = Get-Content C:\temp\replace\dnstoip.txt
$cred = Get-Credential -UserName USERNAME -Message "Enter iLO password"
$OutputObj = @()
foreach ($ilo in $ilos)
{
$OutputObj += Get-HPiLONetworkSetting -Credential $cred -Server $ilo -DisableCertificateAuthentication | select DNS_NAME,DOMAIN_NAME,IP_ADDRESS,SUBNET_MASK,GATEWAY_IP_ADDRESS,PRIM_DNS_SERVER,SEC_DNS_SERVER 
$pb = $ilos.Length/100*$OutputObj.Length
Write-Progress -Activity "Gathering data from " -status "Server $ilo" -percentComplete $pb
}
$OutputObj | Out-GridView
