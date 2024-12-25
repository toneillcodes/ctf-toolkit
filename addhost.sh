#!/bin/bash

function printhelp() {
	echo "Usage: $0 [-i ip] [-h hostname]"
}

if [ $# -eq 0 ]; then
	printhelp
	exit 1
fi

while getopts "i:h:" option; do
  case $option in
    i) # ip addr
      IP="$OPTARG"
      ;;
    h) # hostname
      HOST="$OPTARG"
      ;;
    \?) # invalid option
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
  esac
done

if [ -z "${IP}" ]; then
	echo "IP required"
	exit 1
fi

if [ -z "${HOST}" ]; then
	echo "HOST required"
	exit 1
fi

echo $IP $HOST | sudo tee -a /etc/hosts
