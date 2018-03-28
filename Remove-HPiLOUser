Set-HPiLOSessionTimeOut -TimeOut 120
$iloservers = get-content C:\temp\ilouseradd\ilo-ipaddress_test.txt
foreach ($iloip in $iloservers)
{
Remove-HPiLOUser -Server $iloip -Username Administrator -Password password -RemoveUserLogin test-user -DisableCertificateAuthentication -Debug
}
