#Adding a new user(read only) to iLO
Set-HPiLOSessionTimeOut -TimeOut 120 -Verbose
$iloservers = get-content C:\temp\ilouseradd\ilo-ipaddress.txt
$iloaccaunt=read-host "Enter the account from ILO"
$ilopassword=read-host "Enter the password ILO"
$externaluserlogin=read-host "Enter the account new user"
$externaluserpassword=read-host "Enter a password for the new user"
foreach ($iloip in $iloservers)
{
Add-HPiLOUser -AdminPriv No -ConfigILOPriv No -DisableCertificateAuthentication -NewPassword $externaluserpassword -NewUserLogin $externaluserlogin -NewUsername $externaluserlogin -Password $ilopassword -RemoteConsPriv No -ResetServerPriv No -Server $iloip -Username $iloaccaunt -VirtualMediaPriv No -Debug
}
