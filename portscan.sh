#!/bin/bash

function printhelp() {
	echo "Usage: $0 -t HOSTNMAE/IP"
}

if [ $# -eq 0 ]; then
	printhelp
	exit 1
fi

while getopts "t:" option; do
  case $option in
    t) # target
      target="$OPTARG"
      ;;
    \?) # invalid option
	  printhelp
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
  esac
done

if [ -z $target ]; then
	echo "target option (-t) required"
	printhelp
	exit 1
fi

timestamp=$(date +"%Y%m%d-%H%M%S")
echo "[*] Executing attack script against target: $target @ $timestamp"

echo "[*] Collecting open ports (port-list.txt)"
# find open ports, store in port-list.txt
ports=$(nmap -p- --min-rate=1000 -T4 $target | grep ^[0-9] | cut -f1 -d '/' | tr '\n' ',' | sed s/,$//)
echo $ports > port-list.txt

echo "[*] Running NMAP Script and Version scans (port-recon.txt)"
# collect additional info about open ports, store in port-recon.txt
nmap -sC -sV -p$ports $target -oN port-recon.txt

echo "[*] Done."
