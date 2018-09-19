
$dnsnames = Get-Content C:\temp\dnstoip.txt

foreach ($dnsname in $dnsnames)

{

Resolve-DnsName -Name $dnsname | select Name,IPAddress

}
